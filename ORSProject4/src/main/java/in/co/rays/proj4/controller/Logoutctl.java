/*
 * package in.co.rays.proj4.controller;
 * 
 * import java.io.IOException;
 * 
 * import javax.servlet.ServletException; import
 * javax.servlet.annotation.WebServlet; import
 * javax.servlet.http.HttpServletRequest; import
 * javax.servlet.http.HttpServletResponse; import
 * javax.servlet.http.HttpSession;
 * 
 * import org.apache.log4j.Logger;
 * 
 * import in.co.rays.proj4.Bean.UserBean; import
 * in.co.rays.proj4.Exception.ApplicationException; import
 * in.co.rays.proj4.model.RoleModel; import in.co.rays.proj4.model.UserModel;
 * import in.co.rays.proj4.util.DataUtility; import
 * in.co.rays.proj4.util.ServletUtility;
 * 
 * @WebServlet(name = "Logoutctl", urlPatterns = { "/ctl/Logoutctl" })
 * 
 * public class Logoutctl extends BaseCtl {
 * 
 * 
 * 
 * private static Logger log = Logger.getLogger(LoginCtl.class);
 * 
 * public static final String OP_LOG_OUT = "logout";
 * 
 * @Override protected void doGet(HttpServletRequest request,
 * HttpServletResponse response) throws ServletException, IOException {
 * 
 * log.debug(" Method doGet Started");
 * 
 * String op = DataUtility.getString(request.getParameter("operation"));
 * 
 * UserModel model = new UserModel(); RoleModel role = new RoleModel();
 * 
 * long id = DataUtility.getLong(request.getParameter("id"));
 * 
 * if (id > 0) { UserBean userbean; try { userbean = model.findByPK(id);
 * ServletUtility.setBean(userbean, request); } catch (ApplicationException e) {
 * ServletUtility.handleException(e, request, response); return;
 * 
 * 
 * String op = request.getParameter("operation");
 * 
 * if(OP_LOG_OUT.equals(op))
 * 
 * {
 * 
 * HttpSession session = request.getSession();
 * 
 * session.invalidate();
 * 
 * ServletUtility.setSuccessMessage("User Logged Out Successfully..", request);
 * 
 * ServletUtility.forward(ORSView.LOGIN_VIEW, request, response);
 * 
 * return;
 * 
 * }ServletUtility.forward(getView(), request, response);
 * log.debug("UserCtl Method doPost Ended");
 * 
 * @Override protected String getView() { // TODO Auto-generated method stub
 * return ORSView.LOGIN_VIEW; }
 * 
 * }
 */