namespace Domas.Web.Mvc.UI.Html
{
    public class GridHiddenCellBuilderDecorator : IGridCellBuilderDecorator
    {
        public void Decorate(IHtmlNode td)
        {
            td.Css("display", "none");              
        }
    }
}
