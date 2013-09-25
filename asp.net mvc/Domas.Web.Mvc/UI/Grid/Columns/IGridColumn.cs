namespace Domas.Web.Mvc.UI
{
    using System;
    using System.Collections.Generic;
    using Infrastructure;
    using Domas.Web.Mvc.UI.Html;

    public interface IGridColumn
    {
        bool IsLast
        {
            get;
        }

        string ClientTemplate
        {
            get;
            set;
        }
        
        string ClientFooterTemplate
        {
            get;
            set;
        }        
        
        HtmlTemplate HeaderTemplate
        {
            get;
            set;
        }        

        HtmlTemplate<GridAggregateResult> FooterTemplate
        {
            get;
            set;
        }

        bool Encoded
        {
            get;
            set;
        }
      
        IDictionary<string, object> HeaderHtmlAttributes 
        { 
            get; 
        }

        IDictionary<string, object> FooterHtmlAttributes
        {
            get;
        }         
        
        bool Hidden 
        { 
            get; 
            set; 
        }
       
        bool IncludeInMenu
        {
            get;
            set;
        }
        
        IDictionary<string, object> HtmlAttributes 
        { 
            get; 
        }
        
        string Title 
        { 
            get; 
            set; 
        }
        
        bool Visible 
        { 
            get; 
            set; 
        }
        
        string Width 
        { 
            get; 
            set; 
        }

        IGrid Grid
        {
            get;
        }

        IGridDataCellBuilder CreateDisplayBuilder(IGridHtmlHelper htmlHelper);

        IGridDataCellBuilder CreateEditBuilder(IGridHtmlHelper htmlHelper);

        IGridDataCellBuilder CreateInsertBuilder(IGridHtmlHelper htmlHelper);

        IGridCellBuilder CreateHeaderBuilder();

        IGridCellBuilder CreateFooterBuilder(IEnumerable<AggregateResult> aggregateResults);
        
        IGridCellBuilder CreateGroupFooterBuilder(IEnumerable<AggregateResult> aggregatesResults);
    }
}