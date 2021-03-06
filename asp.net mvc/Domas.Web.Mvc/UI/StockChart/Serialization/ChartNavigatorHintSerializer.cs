namespace Domas.Web.Mvc.UI
{
    using System.Collections.Generic;
    using Domas.Web.Mvc.Infrastructure;
    using Domas.Web.Mvc.Extensions;

    internal class ChartNavigatorHintSerializer : IChartSerializer
    {
        private readonly ChartNavigatorHint hint;

        public ChartNavigatorHintSerializer(ChartNavigatorHint hint)
        {
            this.hint = hint;
        }

        public virtual IDictionary<string, object> Serialize()
        {
            var result = new Dictionary<string, object>();
            FluentDictionary.For(result)
                .Add("visible", hint.Visible, () => hint.Visible.HasValue)
                .Add("template", hint.Template, () => hint.Template.HasValue())
                .Add("format", hint.Format, () => hint.Format.HasValue());

            return result;
        }
    }
}