#pragma checksum "..\..\..\..\..\Views\Borrow\BorrowMainView.xaml" "{ff1816ec-aa5e-4d10-87f7-6f4963833460}" "E70ABF7E2E0E63B9BBDEF1455FAB3B53BF075C47"
//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:4.0.30319.42000
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

using LibraryManagementApplication.Views.Borrow;
using System;
using System.Diagnostics;
using System.Windows;
using System.Windows.Automation;
using System.Windows.Controls;
using System.Windows.Controls.Primitives;
using System.Windows.Controls.Ribbon;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Ink;
using System.Windows.Input;
using System.Windows.Markup;
using System.Windows.Media;
using System.Windows.Media.Animation;
using System.Windows.Media.Effects;
using System.Windows.Media.Imaging;
using System.Windows.Media.Media3D;
using System.Windows.Media.TextFormatting;
using System.Windows.Navigation;
using System.Windows.Shapes;
using System.Windows.Shell;


namespace LibraryManagementApplication.Views.Borrow {
    
    
    /// <summary>
    /// BorrowMainView
    /// </summary>
    public partial class BorrowMainView : System.Windows.Window, System.Windows.Markup.IComponentConnector {
        
        
        #line 32 "..\..\..\..\..\Views\Borrow\BorrowMainView.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button btnExit;
        
        #line default
        #line hidden
        
        
        #line 35 "..\..\..\..\..\Views\Borrow\BorrowMainView.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button btnAddToBorrow;
        
        #line default
        #line hidden
        
        
        #line 36 "..\..\..\..\..\Views\Borrow\BorrowMainView.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button btnBorrowInvoice;
        
        #line default
        #line hidden
        
        private bool _contentLoaded;
        
        /// <summary>
        /// InitializeComponent
        /// </summary>
        [System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [System.CodeDom.Compiler.GeneratedCodeAttribute("PresentationBuildTasks", "6.0.3.0")]
        public void InitializeComponent() {
            if (_contentLoaded) {
                return;
            }
            _contentLoaded = true;
            System.Uri resourceLocater = new System.Uri("/LibraryManagementApplication;component/views/borrow/borrowmainview.xaml", System.UriKind.Relative);
            
            #line 1 "..\..\..\..\..\Views\Borrow\BorrowMainView.xaml"
            System.Windows.Application.LoadComponent(this, resourceLocater);
            
            #line default
            #line hidden
        }
        
        [System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [System.CodeDom.Compiler.GeneratedCodeAttribute("PresentationBuildTasks", "6.0.3.0")]
        [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Never)]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Design", "CA1033:InterfaceMethodsShouldBeCallableByChildTypes")]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Maintainability", "CA1502:AvoidExcessiveComplexity")]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1800:DoNotCastUnnecessarily")]
        void System.Windows.Markup.IComponentConnector.Connect(int connectionId, object target) {
            switch (connectionId)
            {
            case 1:
            
            #line 12 "..\..\..\..\..\Views\Borrow\BorrowMainView.xaml"
            ((LibraryManagementApplication.Views.Borrow.BorrowMainView)(target)).Loaded += new System.Windows.RoutedEventHandler(this.Window_Loaded);
            
            #line default
            #line hidden
            return;
            case 2:
            this.btnExit = ((System.Windows.Controls.Button)(target));
            
            #line 32 "..\..\..\..\..\Views\Borrow\BorrowMainView.xaml"
            this.btnExit.Click += new System.Windows.RoutedEventHandler(this.btnExit_Click);
            
            #line default
            #line hidden
            return;
            case 3:
            this.btnAddToBorrow = ((System.Windows.Controls.Button)(target));
            
            #line 35 "..\..\..\..\..\Views\Borrow\BorrowMainView.xaml"
            this.btnAddToBorrow.Click += new System.Windows.RoutedEventHandler(this.btnAddToBorrow_Click);
            
            #line default
            #line hidden
            return;
            case 4:
            this.btnBorrowInvoice = ((System.Windows.Controls.Button)(target));
            
            #line 36 "..\..\..\..\..\Views\Borrow\BorrowMainView.xaml"
            this.btnBorrowInvoice.Click += new System.Windows.RoutedEventHandler(this.btnBorrowInvoice_Click);
            
            #line default
            #line hidden
            return;
            }
            this._contentLoaded = true;
        }
    }
}

