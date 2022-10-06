package patterns.abstractfactory.fabrique.a;

import patterns.abstractfactory.fabrique.WidgetFabrique;

public class WidgetFabriqueA implements WidgetFabrique{
    public WidgetFabriqueA(){
        System.out.println("WidgetFabriqueA");
    }

    public ScrollBarA fabriqueScrollBar() {
        return  new ScrollBarA();
    }

    public FenetreA fabriqueFenetre() {
        return new FenetreA();
    }

}
