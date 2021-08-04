


import 'dart:html';

import 'package:angular/angular.dart';

import 'hightlight.dart';

@Directive(selector: '[mysafeInnerHtml]')
class MySafeInnerHtmlDirective {
  final Element _element;

  MySafeInnerHtmlDirective(this._element);

  @Input()
  set mysafeInnerHtml(String safeInnerHtml) {
    _element.setInnerHtml(
        safeInnerHtml.toString(),
        treeSanitizer: NodeTreeSanitizer.trusted,
      );
  for (var block in _element.querySelectorAll('pre code')) {
    try {
      highlightBlock(block);
    } catch (e) {
      window.console.error('Error highlighting markdown:');
      window.console.error(e);
    }
  }
  for(var block in _element.querySelectorAll('img')){
    block.style.maxWidth='100%';
    block.style.height='auto';
    block.style.color='inherit';
    block.style.padding = '0px';
    block.style.display = 'block';
    block.style.fontSize = 'inherit';
    block.style.textAlign='center';
  }

  for(var block in _element.querySelectorAll('iframe')){
    block.style.maxWidth='100%';
    block.style.height='auto';
    block.style.color='inherit';
    block.style.padding = '0px';
    block.style.display = 'block';
    block.style.fontSize = 'inherit';
  }
  }
}