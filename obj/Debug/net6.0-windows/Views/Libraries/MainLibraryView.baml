   M S B A M L   `   `   `  ����W  SLibraryManagementApplication, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullk:clr-namespace:LibraryManagementApplication.Views.Libraries,LibraryManagementApplication.Views.Libraries  5   	   B    <LibraryManagementApplication.Views.Libraries.MainLibraryView   5   	   W SPresentationCore, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   Llocal:clr-namespace:LibraryManagementApplication.Views.Libraries     5   	   -   5          � Title$  MainLibraryView��5   	   $	��450��6!   $	��800��6.    � WindowStartupLocation$ CenterScreen=�5	       � WindowStyle$
 None=�5
   
    � WindowState$ 	Maximized=�5   
   .��5      �  � ColumnDefinitions 5   
   �� 5      $��9* �6   �� 5      $
��auto �6    � RowDefinitions 5   
   �� 5      �� 5      $	��10* �6   �� 5      .+�5   
   �� $��29��6   $��0��6!   $��0��6.    �� Orientation$ 
Horizontal=�6>   $	��Top=�6W   ���#0066ff.+�5      �� $��15(�6   
�������.��65   Library main window6J   5      �� 5   
   $��0��6   ���#0066ff$��1��67   $ 
Horizontal=�6G   $	��Top=�6`   $��Right=�6x   .+�5!      �� -   5         ��Name$ btnExit��5!      ���#0066ff$��0q�6R   
������ 
�������$��0,0,10,0q�6�   $��15(�6�   $��40��6�   $��29��6�   $��Microsoft JhengHei UI)�6�   .��6�   X6�   5"      �� 5#   
   $ 
Horizontal=�6   $��Center=�6.   $��1��6K   $��2��6X   $��Center=�6l   .+�5$      �� -   5        $ btnAddToLibrary��5$      $��15(�6L   ���#006699
�������$	��110��6�   $	��120��6�   .��6�   Add to Library6�   �� 5%      -   5        $ btnLibraryInvoice��5%   '   $��10,0,0,0q�6   $��15(�6b   ���#006699
�������$	��110��6�   $	��120��6�   .��6�   Library Invoices6�   5&      5)      5*      