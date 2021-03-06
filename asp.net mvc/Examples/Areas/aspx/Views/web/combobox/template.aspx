<%@ Page Title="" Language="C#" MasterPageFile="~/Areas/aspx/Views/Shared/Web.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ContentPlaceHolderID="MainContent" runat="server">

<div class="demo-section">
    <h2>Customers</h2>
    <%= Html.Kendo().ComboBox()
          .Name("customers")
          .DataTextField("ContactName")
          .DataValueField("CustomerID")
          .HtmlAttributes(new { style = "width: 400px" })
          .DataSource(source =>
          {
              source.Read(read =>
              {
                  read.Action("GetCustomers", "Home");
              });
          })
          .Filter("startswith")
          .Template("<img src=\"" + Url.Content("~/Content/web/Customers/") + "${data.CustomerID}.jpg\" alt=\"${data.CustomerID}\" />" +
                    "<dl>" +
                        "<dt>Contact:</dt><dd>${ data.ContactName }</dd>" +
                        "<dt>Company:</dt><dd>${ data.CompanyName }</dd>" +
                    "</dl>")
    %>
</div>

<div class="demo-section">
    <h2>Information</h2>
    <p>
        Open the ComboBox to see the customized appearance of the items.
    </p>
</div>

<style scoped>
    .demo-section {
        width: 400px;
        padding: 30px;
    }
    .demo-section h2 {
        text-transform: uppercase;
        font-size: 1.2em;
        margin-bottom: 10px;
    }
    #customers-list .k-item {
        overflow: hidden; /* clear floated images */
    }
    #customers-list img {
        -moz-box-shadow: 0 0 2px rgba(0,0,0,.4);
        -webkit-box-shadow: 0 0 2px rgba(0,0,0,.4);
        box-shadow: 0 0 2px rgba(0,0,0,.4);
        float: left;
        margin: 5px 20px 5px 0px;
    }
    #customers-list h3 {
        margin: 30px 0 10px 0;
        font-size: 2em;
    }
    #customers-list p {
        margin: 0;
    }
</style>
</asp:Content>