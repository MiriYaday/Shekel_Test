using ENV;
using ENV.Data;
using Firefly.Box;
using Firefly.Box.UI.Advanced;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;

namespace Northwind.ProductName.Views
{
    partial class ProductNameStartLetterCView : Shared.Theme.Controls.Form 
    {
        ProductNameStartLetterC _controller;
        public ProductNameStartLetterCView(ProductNameStartLetterC controller)
        {
            _controller = controller;
            InitializeComponent();
        }

    }
}
