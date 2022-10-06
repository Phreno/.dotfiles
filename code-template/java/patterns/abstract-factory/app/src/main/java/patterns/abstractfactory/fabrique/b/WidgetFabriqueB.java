package patterns.abstractfactory.fabrique.b;

import patterns.abstractfactory.fabrique.WidgetFabrique;

public class WidgetFabriqueB implements WidgetFabrique{
    public WidgetFabriqueB(){
        System.out.println("WidgetFabriqueB");
    }

    public ScrollBarB fabriqueScrollBar() {
        return new ScrollBarB();
    }

    public FenetreB fabriqueFenetre() {
        return new FenetreB();
    }

}
