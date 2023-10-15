using ENV;
using ENV.Data;
using Firefly.Box;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Text;

namespace Northwind.ProductName

{
    public class ProductNameStartLetterC : UIControllerBase

    {
        public readonly Models.Products Products = new Models.Products();
        public ProductNameStartLetterC()
        {

            From = Products;

            // return all ProductName that start with letter C from Product table.
            Where.Add(Products.ProductName.StartsWith("C"));
        }
        public void Run() {

            Execute();
        }

        protected override void OnLoad()
        {
            View = () => new Views.ProductNameStartLetterCView(this);
        }
    }
}
