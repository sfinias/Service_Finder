//package utils;
//
//import javax.servlet.ServletRequestEvent;
//import javax.servlet.ServletRequestListener;
//import javax.servlet.annotation.WebListener;
//import javax.servlet.http.HttpServletRequest;
//
//@WebListener
//public class ServletRequestListenerImpl implements ServletRequestListener {
//
//    @Override
//    public void requestDestroyed(ServletRequestEvent sre) {
//        System.out.println("requestDestroyed()");
//    }
//
//    @Override
//    public void requestInitialized(ServletRequestEvent sre) {
//        HttpServletRequest servletRequest = (HttpServletRequest) sre.getServletRequest();
//        System.out.println("requestInitialized() Current thread " + Thread.currentThread().getName() + " with sesison id " + servletRequest.getSession().getId());
//    }
//
//}
