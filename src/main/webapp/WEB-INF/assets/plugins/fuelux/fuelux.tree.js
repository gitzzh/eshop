/*
 * Fuel UX Tree
 * https://github.com/ExactTarget/fuelux
 *
 * Copyright (c) 2014 ExactTarget
 * Licensed under the BSD New license.
 */

// -- BEGIN UMD WRAPPER PREFACE --

// For more information on UMD visit: 
// https://github.com/umdjs/umd/blob/master/jqueryPlugin.js

(function (factory) {
	if (typeof define === 'function' && define.amd) {
		// if AMD loader is available, register as an anonymous module.
		define(['jquery'], factory);
	} else {
		// OR use browser globals if AMD is not present
		factory(jQuery);
	}
}(function ($) {
	// -- END UMD WRAPPER PREFACE --
		
	// -- BEGIN MODULE CODE HERE --

	var old = $.fn.tree;

	// TREE CONSTRUCTOR AND PROTOTYPE

	var Tree = function (element, options) {
		this.$element = $(element);
		this.options = $.extend({}, $.fn.tree.defaults, options);

		this.$element.on('click.fu.tree', '.tree-item', $.proxy( function(ev) { this.selectItem(ev.currentTarget); } ,this));
		//this.$element.on('click.fu.tree', '.tree-branch-name', $.proxy( function(ev) { this.openFolder(ev.currentTarget); }, this));
		this.$element.on('click.fu.tree', '.tree-branch-header', $.proxy( function(ev) { this.openFolder(ev.currentTarget);return false; }, this));
		//ACE
		
		//ACE
		
		if( this.options.folderSelect ){
			this.$element.off('click.fu.tree', '.tree-branch-header');
			this.$element.on('click.fu.tree', '.icon-folder', $.proxy( function(ev) { this.openFolder($(ev.currentTarget).parent()); return false;}, this));
			this.$element.on('click.fu.tree', '.tree-branch-header', $.proxy( function(ev) { this.selectFolder($(ev.currentTarget)); }, this));
		}
		

		this.render();
	};

	Tree.prototype = {
		constructor: Tree,

		destroy: function() {
			// any external bindings [none]
			// empty elements to return to original markup
			this.$element.find("li:not([data-template])").remove();

			this.$element.remove();
			// returns string of markup
			return this.$element[0].outerHTML;
		},

		render: function () {
			this.populate(this.$element);
		},

		populate: function ($el) {
			var self = this;
			var $parent = ($el.hasClass('tree')) ? $el : $el.parent();
			var loader = $parent.find('.tree-loader:eq(0)');
			var treeData = $parent.data();

			loader.removeClass('hide');
			this.options.dataSource( treeData ? treeData : {} , function (items) {
				loader.addClass('hide');

				$.each( items.data, function(index, value) {
					var $entity;

					if(value.type === 'folder') {
						$entity = self.$element.find('[data-template=treebranch]:eq(0)').clone().removeClass('hide').removeAttr('data-template');
						$entity.data(value);
						$entity.find('.tree-branch-name > .tree-label').html(value.text || value.name);
						
						//ACE
						var header = $entity.find('.tree-branch-header');

						if('icon-class' in value)
							header.find('i').addClass(value['icon-class']);
						
						if('additionalParameters' in value
							&& 'item-selected' in value.additionalParameters 
								&& value.additionalParameters['item-selected'] == true) {
								setTimeout(function(){header.trigger('click')}, 0);
						}
						
					} else if (value.type === 'item') {
						$entity = self.$element.find('[data-template=treeitem]:eq(0)').clone().removeClass('hide').removeAttr('data-template');
						$entity.find('.tree-item-name > .tree-label').html(value.text || value.name);
						$entity.data(value);
						
						//ACE
						if('additionalParameters' in value
							&& 'item-selected' in value.additionalParameters 
								&& value.additionalParameters['item-selected'] == true) {
								$entity.addClass ('tree-selected');
								$entity.find('i').removeClass(self.options['unselected-icon']).addClass(self.options['selected-icon']);
								//$entity.closest('.tree-folder-content').show();
						}
					}

					// Decorate $entity with data or other attributes making the
					// element easily accessable with libraries like jQuery.
					//
					// Values are contained within the object returned
					// for folders and items as attr:
					//
					// {
					//     name: "An Item",
					//     type: 'item',
					//     attr = {
					//         'classes': 'required-item red-text',
					//         'data-parent': parentId,
					//         'guid': guid,
					//         'id': guid
					//     }
					// };
					//
					// the "name" attribute is also supported but is deprecated for "text"

					// add attributes to tree-branch or tree-item
					var attr = value['attr'] || value.dataAttributes || [];
					$.each(attr, function(key, value) {
						switch (key) {
							case 'cssClass':
							case 'class':
							case 'className':
								$entity.addClass(value);
								break;
							
							// allow custom icons
							case 'data-icon':
								$entity.find('.icon-item').removeClass().addClass('icon-item ' + value);
								$entity.attr(key, value);
								break;

							// ARIA support
							case 'id':
								$entity.attr(key, value);
								$entity.attr('aria-labelledby', value + '-label');
								$entity.find('.tree-branch-name > .tree-label').attr('id', value + '-label');
								break;

							// id, style, data-*
							default:
								$entity.attr(key, value);
								break;
						}
					});

					// add child nodes
					if($el.hasClass('tree-branch-header')) {
						$parent.find('.tree-branch-children:eq(0)').append($entity);
					} else {
						$el.append($entity);
					}
				});

				// return newly populated folder
				self.$element.trigger('loaded.fu.tree', $parent);
			});
		},

		selectItem: function (el) {
			if(this.options['selectable'] == false) return;//ACE
			
			var $el = $(el);
			var selData = $el.data();
			var $all = this.$element.find('.tree-selected');
			var data = [];
			var $icon = $el.find('.icon-item');

			if (this.options.multiSelect) {
				$.each($all, function(index, value) {
					var $val = $(value);
					if($val[0] !== $el[0]) {
						data.push( $(value).data() );
					}
				});
			} else if ($all[0] !== $el[0]) {
				//
				$all.removeClass('tree-selected').filter(".tree-item")
					.find('i').removeClass(this.options['selected-icon']).addClass(this.options['unselected-icon']);//ACE
				data.push(selData);
			}

			var eventType = 'selected';
			if($el.hasClass('tree-selected')) {
				eventType = 'deselected';
				$el.removeClass('tree-selected');
				if($icon.hasClass(this.options['selected-icon']) || $icon.hasClass(this.options['unselected-icon']) ) {
					$icon.removeClass(this.options['selected-icon']).addClass(this.options['unselected-icon']);//ACE
				}
			} else {
				$el.addClass ('tree-selected');
				// add tree dot back in
				if($icon.hasClass(this.options['selected-icon']) || $icon.hasClass(this.options['unselected-icon']) ) {
					$icon.removeClass(this.options['unselected-icon']).addClass(this.options['selected-icon']);//ACE
				}
				if (this.options.multiSelect) {
					data.push( selData );
				}
			}

			this.$element.trigger(eventType + '.fu.tree', {target: selData, selected: data});

			// Return new list of selected items, the item
			// clicked, and the type of event:
			$el.trigger('updated.fu.tree', {
				selected: data,
				item: $el,
				eventType: eventType
			});
		},

		openFolder: function (el) {
			var $el = $(el); // tree-branch-name
			var $branch;
			var $treeFolderContent;
			var $treeFolderContentFirstChild;

			// if item select only
			//ACE
			
			if (!this.options.folderSelect) {
				$el = $(el).parent(); // tree-branch, if tree-branch-name clicked
			}
			

			$branch = $el.closest('.tree-branch'); // tree branch
			$treeFolderContent = $branch.find('.tree-branch-children');
			$treeFolderContentFirstChild = $treeFolderContent.eq(0);

			// manipulate branch/folder
			var eventType, classToTarget, classToAdd;
			if ($el.find('.'+$.trim(this.options['close-icon'].replace(/(\s+)/g, '.'))).length) {//ACE
				eventType = 'opened';
				classToTarget = this.options['close-icon'];//ACE
				classToAdd = this.options['open-icon'];//ACE

				$branch.addClass('tree-open');
				$branch.attr('aria-expanded', 'true');

				$treeFolderContentFirstChild.removeClass('hide');
				if (!$treeFolderContent.children().length) {
					this.populate($treeFolderContent);
				}

			} else if($el.find('.'+$.trim(this.options['open-icon'].replace(/(\s+)/g, '.')))) {
				eventType = 'closed';
				classToTarget = this.options['open-icon'];//ACE
				classToAdd = this.options['close-icon'];//ACE

				$branch.removeClass('tree-open');
				$branch.attr('aria-expanded', 'false');
				$treeFolderContentFirstChild.addClass('hide');

				// remove if no cache
				if (!this.options.cacheItems) {
					$treeFolderContentFirstChild.empty();
				}

			}
			
			$branch.find('> .tree-branch-header .icon-folder').eq(0)
				//.removeClass(this.options['close-icon'] + ' ' + this.options['open-icon'])
				.removeClass(classToTarget)//ACE
				.addClass(classToAdd);

			this.$element.trigger(eventType + '.fu.tree', $branch.data());
			//event.stopPropagation();
		},
		
		 /*selectFolder: function (clickedElement) {
			var $clickedElement = $(clickedElement);
			var $clickedBranch = $clickedElement.closest('.tree-branch');
			var $selectedBranch = this.$element.find('.tree-branch.tree-selected');
			var clickedData = $clickedBranch.data();
			var selectedData = [];
			var eventType = 'selected';

			// select clicked item
			if($clickedBranch.hasClass('tree-selected')) {
				eventType = 'deselected';
				$clickedBranch.removeClass('tree-selected');
			} else {
				$clickedBranch.addClass('tree-selected');
			}

			if (this.options.multiSelect) {

			// get currently selected
				$selectedBranch = this.$element.find('.tree-branch.tree-selected');

				$.each($selectedBranch, function(index, value) {
					var $value = $(value);
					if($value[0] !== $clickedElement[0]) {
						selectedData.push( $(value).data() );
					}
				});

			} else if ($selectedBranch[0] !== $clickedElement[0]) {
				$selectedBranch.removeClass('tree-selected');

				selectedData.push(clickedData);
			}

			this.$element.trigger(eventType + '.fu.tree', {target: clickedData, selected: selectedData});

			// Return new list of selected items, the item
			// clicked, and the type of event:
			$clickedElement.trigger('updated.fu.tree', {
				selected: selectedData,
				item: $clickedElement,
				eventType: eventType
			});
		},*/
		selectFolder: function (clickedElement) {
			var $clickedElement = $(clickedElement);
			var $clickedBranch = $clickedElement;
			var $all = this.$element.find('.tree-selected');
			var clickedData = $clickedBranch.data();
			var selectedData = [];
			var eventType = 'selected';
			
			// select clicked item
			if($clickedBranch.hasClass('tree-selected')) {
				eventType = 'deselected';
				$clickedBranch.removeClass('tree-selected');
			} else {
				$clickedBranch.addClass('tree-selected');
			}
			
			if (this.options.multiSelect) {
				
				// get currently selected
				$all = this.$element.find('.tree-selected');
				
				$.each($all, function(index, value) {
					var $value = $(value);
					if($value[0] !== $clickedElement[0]) {
						selectedData.push( $(value).data() );
					}
				});
				
			} else if ($all[0] !== $clickedElement[0]) {
				$all.removeClass('tree-selected').filter(".tree-item").find('i').removeClass(this.options['selected-icon']).addClass(this.options['unselected-icon']);
				selectedData.push(clickedData);
			}
			
			this.$element.trigger(eventType + '.fu.tree', {target: clickedData, selected: selectedData});
			
			// Return new list of selected items, the item
			// clicked, and the type of event:
			$clickedElement.trigger('updated.fu.tree', {
				selected: selectedData,
				item: $clickedElement,
				eventType: eventType
			});
		},
		

		

		// collapses open folders
		collapse: function () {
			var cacheItems = this.options.cacheItems;

			// find open folders
			this.$element.find('.'+$.trim(this.options['open-icon'].replace(/(\s+)/g, '.'))).each(function () {//ACE
				// update icon class
				var $this = $(this)
					.removeClass(this.options['open-icon'] + ' ' + this.options['close-icon'])
					.addClass(this.options['close-icon']);

				// "close" or empty folder contents
				var $parent = $this.parent().parent();
				var $folder = $parent.children('.tree-branch-children');

				$folder.addClass('hide');
				if (!cacheItems) {
					$folder.empty();
				}
			});
		},
		//根据属性获取第一个树元素
		getFirstByAttr:function(name,value,callback){
			var returnData,returnEl;
			var $el = this.$element.find(".tree-item,.tree-branch").filter("["+name+"='"+value+"']");
			if($el.length){
				returnData = $el.eq(0).data();
				returnEl = $el.eq(0)[0];
			}
			callback.apply(this,[returnData,returnEl]);
		},
		//获取选中的元素,返回第index个
		getSelectedByIndex:function(index,callback){
			var $all = this.$element.find('.tree-selected');
			var indexEl = null;
			var indexTreeData = null;
			var $index = $all.eq(index);
			if($index.length){
				$index.is(".tree-branch-header") && ($index = $index.parent());
				indexTreeData = $index.data();
				indexEl = $index[0];
			}
			callback.apply(this,[indexTreeData,indexEl]);
		},
		//获取所有选中的元素
		getSelecteds:function(callback){
			var datas = [];
			var els = [];
			var $all = this.$element.find('.tree-selected');
			$all.each(function(){
				var _this = this;
				var $this = $(this);
				if($this.is(".tree-branch-header")){
					$this = $this.parent();
					_this = $this[0];
				}
				datas.push($this.data());
				els.push(_this);
			});
			callback.apply(this,[datas,els]);
		},
		add:function($el,treeData){
			if($el === null)
				this.append(null,treeData);
			else{
				if($el.is(".tree-branch")){
					if($el.is(".tree-open")){
						this.append($el,treeData);
					}else{
						$el.find(".tree-branch-children").children().length && this.append($el,treeData);
						$el.find("> .tree-branch-header .icon-folder").trigger("click.fu.tree")
					}
				}else if($el.is(".tree-item")){
					var $entity = this.createfolder($el.data());
					$el.replaceWith($entity);
					this.append($entity,treeData);
					$entity.find(".icon-folder").trigger("click.fu.tree")
				}
			}
		},
		remove:function($el,treeData){
			if($el && $el.length){
				var $parent = $el.parent();
				$el.remove();
				if(!$parent.is(".tree") && !$parent.children().length){
					var $folder = $parent.parent();
					$folder.replaceWith(this.createItem($folder.data()));
				}
			}
		},
		createfolder:function(data){
			data["type"] = "folder";
			var $entity;
			$entity = this.$element.find('[data-template=treebranch]:eq(0)').clone().removeClass('hide').removeAttr('data-template');
			$entity.find('.tree-branch-name > .tree-label').html(data.text || data.name);
			$entity.data(data);
			// add attributes to tree-branch or tree-item
			var attr = data['attr'] || data.dataAttributes || [];
			$.each(attr, function(key, value) {
				switch (key) {
					case 'cssClass':
					case 'class':
					case 'className':
						$entity.addClass(value);
						break;
					
					// allow custom icons
					case 'data-icon':
						$entity.find('.icon-item').removeClass().addClass('icon-item ' + value);
						$entity.attr(key, value);
						break;

					// ARIA support
					case 'id':
						$entity.attr(key, value);
						$entity.attr('aria-labelledby', value + '-label');
						$entity.find('.tree-branch-name > .tree-label').attr('id', value + '-label');
						break;

					// id, style, data-*
					default:
						$entity.attr(key, value);
						break;
				}
			});
			return $entity;
		},
		createItem:function(data){
			data["type"] = "item";
			var $entity;
			$entity = this.$element.find('[data-template=treeitem]:eq(0)').clone().removeClass('hide').removeAttr('data-template');
			$entity.find('.tree-item-name > .tree-label').html(data.text || data.name);
			$entity.data(data);
			// add attributes to tree-branch or tree-item
			var attr = data['attr'] || data.dataAttributes || [];
			$.each(attr, function(key, value) {
				switch (key) {
					case 'cssClass':
					case 'class':
					case 'className':
						$entity.addClass(value);
						break;
					
					// allow custom icons
					case 'data-icon':
						$entity.find('.icon-item').removeClass().addClass('icon-item ' + value);
						$entity.attr(key, value);
						break;

					// ARIA support
					case 'id':
						$entity.attr(key, value);
						$entity.attr('aria-labelledby', value + '-label');
						$entity.find('.tree-branch-name > .tree-label').attr('id', value + '-label');
						break;

					// id, style, data-*
					default:
						$entity.attr(key, value);
						break;
				}
			});
			return $entity;
		},
		/*createElement:function(data){
			var $entity;
			if(data["type"] === "item"){
				$entity = this.$element.find('[data-template=treeitem]:eq(0)').clone().removeClass('hide').removeAttr('data-template');
				$entity.find('.tree-item-name > .tree-label').html(data.text || data.name);
			}else if(data["type"] === "folder"){
				$entity = this.$element.find('[data-template=treebranch]:eq(0)').clone().removeClass('hide').removeAttr('data-template');
				$entity.find('.tree-branch-name > .tree-label').html(data.text || data.name);
			}
			$entity.data(data);
			return $entity;
		},*/
		update:function($el,treeData){
			$el.data(treeData);
			$el.find('.tree-item-name > .tree-label').html(treeData.text || treeData.name);
			var attr = treeData['attr'] || treeData.dataAttributes || [];
			$.each(attr, function(key, value) {
				switch (key) {
					case 'cssClass':
					case 'class':
					case 'className':
						$el.addClass(value);
						break;
					
					// allow custom icons
					case 'data-icon':
						$el.find('.icon-item').removeClass().addClass('icon-item ' + value);
						$el.attr(key, value);
						break;

					// ARIA support
					case 'id':
						$el.attr(key, value);
						$el.attr('aria-labelledby', value + '-label');
						$el.find('.tree-branch-name > .tree-label').attr('id', value + '-label');
						break;

					// id, style, data-*
					default:
						$el.attr(key, value);
						break;
				}
			});
		},
		append:function($parent,treeData){
			var self =this;
			$parent = $parent || self.$element;
			var $entity;
			if(treeData.type === 'folder') {
				$entity = self.$element.find('[data-template=treebranch]:eq(0)').clone().removeClass('hide').removeAttr('data-template');
				$entity.data(treeData);
				$entity.find('.tree-branch-name > .tree-label').html(treeData.text || treeData.name);
				
				//ACE
				var header = $entity.find('.tree-branch-header');

				if('icon-class' in value)
					header.find('i').addClass(value['icon-class']);
				
				if('additionalParameters' in treeData
					&& 'item-selected' in treeData.additionalParameters 
						&& treeData.additionalParameters['item-selected'] == true) {
						setTimeout(function(){header.trigger('click')}, 0);
				}
				
			} else if (treeData.type === 'item') {
				$entity = self.$element.find('[data-template=treeitem]:eq(0)').clone().removeClass('hide').removeAttr('data-template');
				$entity.find('.tree-item-name > .tree-label').html(treeData.text || treeData.name);
				$entity.data(treeData);
				
				//ACE
				if('additionalParameters' in treeData
					&& 'item-selected' in treeData.additionalParameters 
						&& treeData.additionalParameters['item-selected'] == true) {
						$entity.addClass ('tree-selected');
						$entity.find('i').removeClass(self.options['unselected-icon']).addClass(self.options['selected-icon']);
						//$entity.closest('.tree-folder-content').show();
				}
			}
			// add attributes to tree-branch or tree-item
			var attr = treeData['attr'] || treeData.dataAttributes || [];
			$.each(attr, function(key, value) {
				switch (key) {
					case 'cssClass':
					case 'class':
					case 'className':
						$entity.addClass(value);
						break;
					
					// allow custom icons
					case 'data-icon':
						$entity.find('.icon-item').removeClass().addClass('icon-item ' + value);
						$entity.attr(key, value);
						break;

					// ARIA support
					case 'id':
						$entity.attr(key, value);
						$entity.attr('aria-labelledby', value + '-label');
						$entity.find('.tree-branch-name > .tree-label').attr('id', value + '-label');
						break;

					// id, style, data-*
					default:
						$entity.attr(key, value);
						break;
				}
			});

			// add child nodes
			$parent.is(".tree") && $parent.append($entity);
			$parent.is(".tree") || $parent.find('.tree-branch-children:eq(0)').append($entity);
		}
	};


	// TREE PLUGIN DEFINITION

	$.fn.tree = function (option) {
		var args = Array.prototype.slice.call( arguments, 1 );
		var methodReturn;

		var $set = this.each(function () {
			var $this   = $( this );
			var data    = $this.data( 'fu.tree' );
			var options = typeof option === 'object' && option;

			if( !data ) $this.data('fu.tree', (data = new Tree( this, options ) ) );
			if( typeof option === 'string' ) methodReturn = data[ option ].apply( data, args );
		});

		return ( methodReturn === undefined ) ? $set : methodReturn;
	};

	$.fn.tree.defaults = {
		dataSource: function(options, callback){},
		multiSelect: false,
		cacheItems: true,
		folderSelect: false//ACE
	};

	$.fn.tree.Constructor = Tree;

	$.fn.tree.noConflict = function () {
		$.fn.tree = old;
		return this;
	};


	// NO DATA-API DUE TO NEED OF DATA-SOURCE

// -- BEGIN UMD WRAPPER AFTERWORD --
}));
	// -- END UMD WRAPPER AFTERWORD --
