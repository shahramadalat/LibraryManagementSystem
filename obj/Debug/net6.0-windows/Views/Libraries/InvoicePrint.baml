   M S B A M L   `   `   `  ����W  SLibraryManagementApplication, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullk:clr-namespace:LibraryManagementApplication.Views.Libraries,LibraryManagementApplication.Views.Libraries  5   	   ?    9LibraryManagementApplication.Views.Libraries.InvoicePrint   5   	   W SPresentationCore, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   Llocal:clr-namespace:LibraryManagementApplication.Views.Libraries     5   	   -   5          � Title$  InvoicePrint��5   	   $
��auto��6   $	��816��6,    � WindowStartupLocation$ CenterScreen=�5	   	    � WindowStyle$
 None=�5
   	    � 	Resources 5       �� 
TargetType �� Property �� Value��%  '��       '�� u     '��     �� 5   
   " ��6   .�5      ��  � ��$ Center=�62   �� 5       � ��$ 18(�6)   66   5      �� 5   
   " ��6   .�5      ��  � ��$
 auto��6&   �� 5       � ��$	 150��6)   67   �� 5       � ��$ 30��6'   5      �� 5   
   " ��6   .�5      ��  � �� �#0066ff6+   �� 5       � ��
 �����6+   �� 5       � ��$ 60��6&   �� 5       � ��$ 40��6'   �� 5       � ��$ 10,0,0,0q�6'   5      5      .��5       � $
��True��6    � ColumnDefinitions 5!   
   �� 5"      $��* �6   �� 5#      $
��auto �6    � RowDefinitions 5%   
   �� 5&      $
��auto �6   �� 5'      $
��auto �6   .+�5)   
   �� $��29��6   $��0��6!   	 �� Orientation$	 
Horizontal=�6/   $	��Top=�6H   ���#0066ff.+�5*      �� $��15(�6   
�������.��65   Books6<   5+      �� 5,   
   $��0��6   ���#0066ff$��1��67   $	 
Horizontal=�6G   $	��Top=�6`   $��Right=�6x   .+�5-      �� -   5        
 ��Name$
 btnPrint��5-      ���#0066ff$��0q�6T   
������ 
�������$��0,0,10,0q�6�   $��15(�6�   $��40��6�   $��29��6�   $��Microsoft JhengHei UI)�6�   .��6�   Print6�   �� 5.      -   5        $
 btnExit��5.      ���#0066ff$��0q�6R   
������ 
�������$��0,0,10,0q�6�   $��15(�6�   $��40��6�   $��29��6�   $��Microsoft JhengHei UI)�6�   .��6�   X6�   5/      �� 51   
   -   5         ��Name$ 
stackPrint��51       �� CanVerticallyScroll$
 True��6)    �� CanHorizontallyScroll$
 True��6D   $	��900��6a   $	��750��6n   $��2��6z   $��0��6�   $��1��6�   $	 Vertical=�6�   $��10q�6�   .+�52      �� $	 
Horizontal=�6   $��Center=�62   $��Center=�6M   .+�53      �� .��6   Invoice Id:6&   �� 54      -   5         ��Name$ lblInvoiceId��54      .��6.   661   55      �� 56      $	 
Horizontal=�6   $��Center=�62   $��Center=�6M   .+�57      �� .��6   Date:6   �� 58      -   5        $ lblDate��58      .��6)   20-200-200066   59      �� 5:      $	 
Horizontal=�6   $��Center=�62   $��Center=�6M   .+�5;      �� .��6   Employee Id:6&   �� 5<      -   5        $ lblAccountId��5<      .��6.   661   5=      �� 5>      $	 
Horizontal=�6   $��Center=�62   $��Center=�6M   .+�5?      �� .��6   Total:6    �� 5@      -   5        $ lblTotal��5@      .��6*   4000061   5A      &   System.Windows.Controls.DataGrid  5B      -	   5          Name$ AccountDatagrid��5C      ��5D      �� *
accounts+   Columns 5F      0  *System.Windows.Controls.DataGridTextColumn  5G      ,  &System.Windows.Controls.DataGridColumn   
Visibility$ 	Collapsed=�6)      Width5  /System.Windows.Controls.DataGridLengthConverter$ * 6b      MinWidth$	 150Q�6l      Header$ LibraryNoteId��6{   1  +System.Windows.Controls.DataGridBoundColumn   Binding 6@   �� *LibraryNoteId+6�     5H      $ 	Collapsed=�6)   $ * 6[   $	 150Q�6e   $ BookId��6t    6@   �� *BookId+6�     5I      $ * 6F   $	 150Q�6P   $ 	Book name��6_    6)   �� *
BookName+6t     5J      $ * 6F   $	 150Q�6P   $ Quantity��6_    6)   �� *
Quantity+6s     5K      $ * 6G   $	 150Q�6Q   $ Price��6`    6)   �� *	BookPrice+6q     5L      $ * 6C   $	 150Q�6M   $ Total��6\    6)   �� *Total+6m   5N      5P      5Q      5R      