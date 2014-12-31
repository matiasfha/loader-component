template = document._currentScript.ownerDocument.querySelector 'template#m-loader'
prototype = Object.create HTMLElement.prototype, do ->
	shadowRoot:
		value:null
		writable:true
	createdCallback:
		value: ->
			@shadowRoot = @createShadowRoot()
			@addEventListener 'hide',@hideCallback
			@addEventListener 'show',@showCallback

	attachedCallback:
		value: ->
			@shadowRoot.appendChild document.importNode template.content,true

	hideCallback:
		value: ->
			@className = 'hide'

	showCallback:
		value: ->
			@className = 'show'

Loader = document.registerElement 'm-loader', prototype:prototype

module?.exports = {Loader}
