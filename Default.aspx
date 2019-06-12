<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebApplication3.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Listado de empleados</title>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <script src="Scripts/jquery-3.0.0.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    <script src="Scripts/popper.min.js"></script>
    <style type="text/css">
      .hiddencol
      {
        display: none;
      }
    </style>
</head>
<body>
    <form id="form1" class="form-horizontal" runat="server">

        <!--botones sin usar --> 
        <asp:Button style="display:none;" ID="btnEliminar" runat="server" OnClick="btnEliminar_Click" Text="Eliminar" />
 
        <div class="container">
          <div class="row">
              <div class="col-lg-12">
              <div class="row">
                  <div class="col-lg-12">
                        <div class="col-lg-2">
                        <asp:Label ID="Label1" runat="server" CssClass="control-label col-sm-2" Text="Clave"/>
                        </div>
                        <div class="col-lg-10">
                            <asp:TextBox ID="txID" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                      
                  </div>
              </div>
              <div class="row">
                  <div class="col-lg-12">
                  <div class="form-group">
                    <asp:Label ID="Label2" runat="server" CssClass="control-label col-sm-2" Text="Nombre"/>
                     <div class="col-sm-10">
                         <asp:TextBox ID="Nombre" runat="server" CssClass="form-control"></asp:TextBox>
                     </div>
                  </div>
                  </div>
              </div>

              <div class="row">
                  <div class="col-lg-12">
                      <div class="form-group"> 
                         <asp:Label ID="Label3" runat="server" CssClass="control-label col-sm-2" Text="A. Paterno"/>
                         <div class="col-sm-10">
                             <asp:TextBox ID="ApPaterno" runat="server" CssClass="form-control"></asp:TextBox>
                         </div>
                      </div>
                  </div>
                  <div class="col-lg-12">
                      <div class="form-group"> 
                          <asp:Label ID="Label4" runat="server" CssClass="control-label col-sm-2" Text="A. Materno"/>
                          <div class="col-sm-10">
                              <asp:TextBox ID="ApMaterno" runat="server" CssClass="form-control"></asp:TextBox>
                          </div>
                      </div>
                  </div>
              </div>
              <div class="form-group"> 
                  <asp:Label ID="Label5" runat="server" CssClass="control-label col-sm-2" Text="Sueldo"/>
                  <div class="col-sm-10">
                      <asp:TextBox ID="Money" runat="server" CssClass="form-control"></asp:TextBox>
                  </div>
              </div>
              <div class="form-group"> 
                  <asp:Label ID="Label7" runat="server" CssClass="control-label col-sm-2" Text="Departamento"/>
                  <div class="col-sm-10">
                       <asp:DropDownList ID="DropDownList1"  runat="server" CssClass="form-control" ></asp:DropDownList>
                  </div>
              </div>
              <div class="row">
                  <div class="form-group"> 
                      <asp:Label ID="Label6" runat="server" CssClass="control-label col-sm-2"  Text="Fecha de nacimiento"/>   
                      <div class="col-sm-10">
                          <asp:Calendar ID="Calendar1"  runat="server"></asp:Calendar>
                      </div>
                  </div> 
              </div>
              </div>
          </div>
          <div class="row">
                <div class="col-lg-2">
                        <table style="width:100%">
                            <tr>
                            <td>
                                <asp:Button CssClass="btn-info" ID="btnCrear" runat="server" OnClick="btnCrear_Click" Text="Guardar" /> 
                                <asp:Button CssClass="btn-info" ID="btnModificar" runat="server" OnClick="btnModificar_Click" Text="Guardar" />
                            </td>
                            <td><asp:Button CssClass="btn-success" ID="btnCancelar" runat="server" OnClick="btnCancelar_Click" Text="Cancelar" /></td>
                            </tr>
                        </table>

                </div>
           </div>
         </div>
         <div class="container">
          <div class="row">
             <div class="col-md-8">
             
             </div>
             <div class="col-md-4"> 
               <asp:Button CssClass="btn-info" ID="btnNuevo" runat="server" OnClick="btnNuevo_Click" Text="Nuevo" /> 
             </div>
              <br></br> 
          </div>
          <div class="row">
            <div class="col-lg-12">
                    <asp:GridView CssClass="table-responsive-md" ID="gvDatos" runat="server" AutoGenerateColumns="False" Width="75%" CellPadding="4" ForeColor="#333333" GridLines="None" EmptyDataText="Sin registros" DataKeyNames="Clave_Emp" OnRowCommand="gvDatos_RowCommand">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns> 
                            <asp:BoundField ItemStyle-CssClass="hiddencol" HeaderStyle-CssClass="hiddencol" HeaderText="Clave" DataField="Clave_Emp"/>
                            <asp:BoundField HeaderText="Nombre" DataField="NombreComp"/>
                            <asp:BoundField HeaderText="Fecha Nac." DataField="Fe"/>
                            <asp:BoundField HeaderText="Depto." DataField="Depto"/>  
                            <asp:BoundField HeaderText="Sueldo" DataField="Sueldi"/>

                            <asp:TemplateField HeaderText="Acción" > 
                                <ItemTemplate>
                                    <asp:Button ID="EditarGV" runat="server" CommandName="Editar" CssClass="btn-info" Text="Editar"/>
                                </ItemTemplate>
                            </asp:TemplateField >                           
                            <asp:TemplateField HeaderText="Acción" >  
                                <ItemTemplate>
                                    <asp:Button OnClientClick="return confirm('¿Está seguro de eliminar?');" CssClass="btn-danger" ID="EliminarGV" runat="server" CommandName="Eliminar"  Text="Eliminar"/>
                                </ItemTemplate>
                            </asp:TemplateField>


                        </Columns>
                        <EditRowStyle BackColor="#2461BF" />
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#EFF3FB" />
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#F5F7FB" />
                        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                        <SortedDescendingCellStyle BackColor="#E9EBEF" />
                        <SortedDescendingHeaderStyle BackColor="#4870BE" />
                    </asp:GridView>
            </div>
          </div>
          <div class="row">
              <asp:Label ID="lblResultado" runat="server" CssClass="label" />
          </div>
        </div> 

    </form>
    <script type="text/javascript">
    </script> 
</body>
</html>
