<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<%@include file="../common/common.jsp" %>
<%@include file="../member/commonTop.jsp" %>


<script>
	function like(pno){
		if($('#id').val()=="null"){
			if(confirm("로그인이 필요한 페이지입니다. \n 로그인 하시겠습니까?")){
				location.href="login.mb";	
			}
			return false;
		}
		else{
			$.ajax({
				type : 'post',
				url : "addOrDeletelike.wish",
				data : {
					id : $('#id').val(),
					no : pno,
				},
				success : function(rdata) {
					
					//alert(rdata);
					
					if(rdata == "added"){
						alert("위시리스트에 추가되었습니다.");
						showLikeCount();	
					}else if(rdata == "deleted"){
						alert("위시리스트에서 제거되었습니다.");
					}
				}//success
	
			});//ajax
		}
	}
</script>

            <!--Mobile Menu-->
            <div class="mobile-nav-wrapper" role="navigation">
                <div class="closemobileMenu"><i class="icon an an-times-l pull-right"></i> Close Menu</div>
                <ul id="MobileNav" class="mobile-nav medium">
                    <li class="lvl1 parent megamenu"><a href="index.html">Home <i class="an an-plus-l"></i></a>
                        <ul>
                            <li><a href="#" class="site-nav">Home Styles <i class="an an-plus-l"></i></a>
                                <ul>
                                    <li class="lvl-2"><a href="index.html" class="site-nav">Home 01 - Default</a></li>
                                    <li class="lvl-2"><a href="index-demo2.html" class="site-nav">Home 02 - Minimal</a></li>
                                    <li class="lvl-2"><a href="index-demo3.html" class="site-nav">Home 03 - Colorful</a></li>
                                    <li class="lvl-2"><a href="index-demo4.html" class="site-nav">Home 04 - Modern</a></li>
                                    <li class="lvl-2"><a href="index-demo5.html" class="site-nav">Home 05 - Kids Clothing</a></li>
                                    <li class="lvl-2"><a href="index-demo6.html" class="site-nav">Home 06 - Single Product</a></li>
                                    <li class="lvl-2"><a href="index-demo7.html" class="site-nav">Home 07 - Glamour</a></li>
                                    <li class="lvl-2"><a href="index-demo8.html" class="site-nav">Home 08 - Simple</a></li>
                                    <li class="lvl-2"><a href="index-demo9.html" class="site-nav">Home 09 - Cool <span class="lbl nm_label1">Hot</span></a></li>
                                    <li class="lvl-2"><a href="index-demo10.html" class="site-nav last">Home 10 - Cosmetic</a></li>
                                </ul>
                            </li>
                            <li><a href="#" class="site-nav">Home Styles <i class="an an-plus-l"></i></a>
                                <ul>
                                    <li class="lvl-2"><a href="index-demo11.html" class="site-nav">Home 11 - Pets <span class="lbl nm_label3">Popular</span></a></li>
                                    <li class="lvl-2"><a href="index-demo12.html" class="site-nav">Home 12 - Tools & Parts</a></li>
                                    <li class="lvl-2"><a href="index-demo13.html" class="site-nav">Home 13 - Watches <span class="lbl nm_label1">Hot</span></a></li>
                                    <li class="lvl-2"><a href="index-demo14.html" class="site-nav">Home 14 - Food</a></li>
                                    <li class="lvl-2"><a href="index-demo15.html" class="site-nav">Home 15 - Christmas</a></li>
                                    <li class="lvl-2"><a href="index-demo16.html" class="site-nav">Home 16 - Phone Case</a></li>
                                    <li class="lvl-2"><a href="index-demo17.html" class="site-nav">Home 17 - Jewelry</a></li>
                                    <li class="lvl-2"><a href="index-demo18.html" class="site-nav">Home 18 - Bag <span class="lbl nm_label3">Popular</span></a></li>
                                    <li class="lvl-2"><a href="index-demo19.html" class="site-nav">Home 19 - Swimwear</a></li>
                                    <li class="lvl-2"><a href="index-demo20.html" class="site-nav last">Home 20 - Furniture <span class="lbl nm_label2">New</span></a></li>
                                </ul>
                            </li>
                            <li><a href="#" class="site-nav">Home Styles <i class="an an-plus-l"></i></a>
                                <ul>
                                    <li class="lvl-2"><a href="index-demo21.html" class="site-nav">Home 21 - Party Supplies <span class="lbl nm_label2">New</span></a></li>
                                    <li class="lvl-2"><a href="index-demo22.html" class="site-nav">Home 22 - Digital <span class="lbl nm_label2">New</span></a></li>
                                    <li class="lvl-2"><a href="index-demo23.html" class="site-nav">Home 23 - Vogue <span class="lbl nm_label2">New</span></a></li>
                                    <li class="lvl-2"><a href="index-demo24.html" class="site-nav last">Home 24 - Glamour <span class="lbl nm_label2">New</span></a></li>
                                </ul>
                            </li>
                        </ul>
                    </li>
                    <li class="lvl1 parent megamenu"><a href="#">Shop <i class="an an-plus-l"></i></a>
                        <ul>
                            <li><a href="#" class="site-nav">Category Page <i class="an an-plus-l"></i></a>
                                <ul>
                                    <li><a href="category-2columns.html" class="site-nav">2 Columns with style1</a></li>
                                    <li><a href="category-3columns.html" class="site-nav">3 Columns with style2</a></li>
                                    <li><a href="category-4columns.html" class="site-nav">4 Columns with style3</a></li>
                                    <li><a href="category-5columns.html" class="site-nav">5 Columns with style4</a></li>
                                    <li><a href="category-6columns.html" class="site-nav">6 Columns with Fullwidth</a></li>
                                    <li><a href="category-7columns.html" class="site-nav">7 Columns</a></li>
                                    <li><a href="empty-category.html" class="site-nav last">Category Empty</a></li>
                                </ul>
                            </li>
                            <li><a href="#" class="site-nav">Shop Page <i class="an an-plus-l"></i></a>
                                <ul>
                                    <li><a href="shop-left-sidebar.html" class="site-nav">Left Sidebar</a></li>
                                    <li><a href="shop-right-sidebar.html" class="site-nav">Right Sidebar</a></li>
                                    <li><a href="shop-top-filter.html" class="site-nav">Top Filter</a></li>
                                    <li><a href="shop-fullwidth.html" class="site-nav">Fullwidth</a></li>
                                    <li><a href="shop-no-sidebar.html" class="site-nav">Without Filter</a></li>
                                    <li><a href="shop-listview-sidebar.html" class="site-nav">List View</a></li>
                                    <li><a href="shop-listview-drawer.html" class="site-nav">List View Drawer</a></li>
                                    <li><a href="shop-category-slideshow.html" class="site-nav">Category Slideshow</a></li>
                                    <li><a href="shop-heading-with-banner.html" class="site-nav last">Headings With Banner</a></li>
                                </ul>
                            </li>
                            <li><a href="#" class="site-nav">Shop Page <i class="an an-plus-l"></i></a>
                                <ul>
                                    <li><a href="shop-sub-collections.html" class="site-nav">Sub Collection List <span class="lbl nm_label5">Hot</span></a></li>
                                    <li><a href="shop-masonry-grid.html" class="site-nav">Shop Masonry Grid</a></li>
                                    <li><a href="shop-left-sidebar.html" class="site-nav">Shop Countdown</a></li>
                                    <li><a href="shop-hover-info.html" class="site-nav">Shop Hover Info</a></li>
                                    <li><a href="shop-right-sidebar.html" class="site-nav">Infinite Scrolling</a></li>
                                    <li><a href="shop-fullwidth.html" class="site-nav">Classic Pagination</a></li>
                                    <li><a href="shop-swatches-style.html" class="site-nav">Swatches Style</a></li>
                                    <li><a href="shop-grid-style.html" class="site-nav">Grid Style</a></li>
                                    <li><a href="shop-search-results.html" class="site-nav last">Search Results</a></li>
                                </ul>
                            </li>
                            <li><a href="#" class="site-nav">Shop Other Page <i class="an an-plus-l"></i></a>
                                <ul>
                                    <li><a href="my-wishlist.html" class="site-nav">My Wishlist Style1</a></li>
                                    <li><a href="my-wishlist-style2.html" class="site-nav">My Wishlist Style2</a></li>
                                    <li><a href="compare-style1.html" class="site-nav">Compare Page Style1</a></li>
                                    <li><a href="compare-style2.html" class="site-nav">Compare Page Style2</a></li>
                                    <li><a href="cart-style1.html" class="site-nav">Cart Page Style1</a></li>
                                    <li><a href="cart-style2.html" class="site-nav">Cart Page Style2</a></li>
                                    <li><a href="checkout-style1.html" class="site-nav">Checkout Page Style1</a></li>
                                    <li><a href="checkout-style2.html" class="site-nav">Checkout Page Style2</a></li>
                                    <li><a href="checkout-success.html" class="site-nav last">Checkout Success</a></li>
                                </ul>
                            </li>
                        </ul>
                    </li>
                    <li class="lvl1 parent megamenu"><a href="#">Product <i class="an an-plus-l"></i></a>
                        <ul>
                            <li><a href="product-standard.html" class="site-nav">Product Types<i class="an an-plus-l"></i></a>
                                <ul>
                                    <li><a href="product-standard.html" class="site-nav">Simple Product</a></li>
                                    <li><a href="product-variable.html" class="site-nav">Variable Product</a></li>
                                    <li><a href="product-grouped.html" class="site-nav">Grouped Product</a></li>
                                    <li><a href="product-external-affiliate.html" class="site-nav">External / Affiliate Product</a></li>
                                    <li><a href="product-outofstock.html" class="site-nav">Out Of Stock Product</a></li>
                                    <li><a href="product-layout1.html" class="site-nav">New Product</a></li>
                                    <li><a href="product-layout2.html" class="site-nav">Sale Product</a></li>
                                    <li><a href="product-layout1.html" class="site-nav">Variable Image</a></li>
                                    <li><a href="product-accordian.html" class="site-nav">Variable Select</a></li>
                                    <li><a href="prodcut-360-degree-view.html" class="site-nav last">360 Degree view</a></li>
                                </ul>
                            </li>
                            <li><a href="product-layout1.html" class="site-nav">Product Page Types <i class="an an-plus-l"></i></a>
                                <ul>
                                    <li><a href="product-layout1.html" class="site-nav">Product Layout1</a></li>
                                    <li><a href="product-layout2.html" class="site-nav">Product Layout2</a></li>
                                    <li><a href="product-layout3.html" class="site-nav">Product Layout3</a></li>
                                    <li><a href="product-layout4.html" class="site-nav">Product Layout4</a></li>
                                    <li><a href="product-layout5.html" class="site-nav">Product Layout5</a></li>
                                    <li><a href="product-layout6.html" class="site-nav">Product Layout6</a></li>
                                    <li><a href="product-layout7.html" class="site-nav">Product Layout7</a></li>
                                    <li><a href="product-accordian.html" class="site-nav">Product Accordian</a></li>
                                    <li><a href="product-tabs-left.html" class="site-nav">Product Tabs Left</a></li>
                                    <li><a href="product-tabs-center.html" class="site-nav last">Product Tabs Center</a></li>
                                </ul>
                            </li>
                        </ul>
                    </li>
                    <li class="lvl1 parent megamenu"><a href="#">Collections <i class="an an-plus-l"></i></a>
                        <ul>
                            <li><a href="#" class="site-nav">Bedding <i class="an an-plus-l"></i></a>
                                <ul>
                                    <li><a href="#" class="site-nav">Bedsheets</a></li>
                                    <li><a href="#" class="site-nav">Tablewear</a></li>
                                    <li><a href="#" class="site-nav">Kitchenware</a></li>
                                    <li><a href="#" class="site-nav last">Flooring</a></li>
                                </ul>
                            </li>
                            <li><a href="#" class="site-nav">Kids Furniture <i class="an an-plus-l"></i></a>
                                <ul>
                                    <li><a href="#" class="site-nav">Table Decor</a></li>
                                    <li><a href="#" class="site-nav">Cushion Fillers</a></li>
                                    <li><a href="#" class="site-nav">Kitchen Linen</a></li>
                                    <li><a href="#" class="site-nav last">Bedsheets</a></li>
                                </ul>
                            </li>
                            <li><a href="#" class="site-nav">Shoes Rack <i class="an an-plus-l"></i></a>
                                <ul>
                                    <li><a href="#" class="site-nav">Bedsheets</a></li>
                                    <li><a href="#" class="site-nav">Tablewear</a></li>
                                    <li><a href="#" class="site-nav">Kitchenware</a></li>
                                    <li><a href="#" class="site-nav last">Flooring</a></li>
                                </ul>
                            </li>
                            <li><a href="#" class="site-nav">Bathlinen <i class="an an-plus-l"></i></a>
                                <ul>
                                    <li><a href="#" class="site-nav">Table Decor</a></li>
                                    <li><a href="#" class="site-nav">Cushion Fillers</a></li>
                                    <li><a href="#" class="site-nav">Kitchen Linen</a></li>
                                    <li><a href="#" class="site-nav last">Bedsheets</a></li>
                                </ul>
                            </li>
                        </ul>
                    </li>
                    <li class="lvl1 parent megamenu"><a href="#">Shop Offers <i class="an an-plus-l"></i></a>
                        <ul>
                            <li><a href="product-layout1.html" class="site-nav">Black Flower Vase</a></li>
                            <li><a href="product-layout1.html" class="site-nav">Wooden Baby Chair</a></li>
                            <li><a href="product-layout1.html" class="site-nav">Round Wall Clock</a></li>
                            <li><a href="product-layout1.html" class="site-nav">Cushioned Office Chair</a></li>
                        </ul>
                    </li>
                    <li class="lvl1 parent megamenu"><a href="#">Features <i class="an an-plus-l"></i><span class="lbl nm_label1">New</span></a>
                        <ul>
                            <li><a href="#" class="site-nav">Vendor Pages <i class="an an-plus-l"></i></a>
                                <ul>
                                    <li><a href="vendor-dashboard.html" class="site-nav">Vendor Dashboard</a></li>
                                    <li><a href="vendor-profile.html" class="site-nav">Vendor Profile</a></li>
                                    <li><a href="vendor-uploads.html" class="site-nav">Vendor Uploads</a></li>
                                    <li><a href="vendor-tracking.html" class="site-nav">Vendor Tracking</a></li>
                                    <li><a href="vendor-service.html" class="site-nav">Vendor Service</a></li>
                                    <li><a href="vendor-settings.html" class="site-nav last">Vendor Settings</a></li>
                                </ul>
                            </li>
                            <li><a href="#" class="site-nav">Email Template <i class="an an-plus-l"></i></a>
                                <ul>
                                    <li><a target="_blank" href="email-template/email-order-success1.html" class="site-nav">Order Success 1</a></li>
                                    <li><a target="_blank" href="email-template/email-order-success2.html" class="site-nav">Order Success 2</a></li>
                                    <li><a target="_blank" href="email-template/email-invoice-template1.html" class="site-nav">Invoice Template 1</a></li>
                                    <li><a target="_blank" href="email-template/email-invoice-template2.html" class="site-nav last">Invoice Template 2</a></li>
                                    <li><a target="_blank" href="email-template/email-forgot-password.html" class="site-nav">Mail Reset password</a></li>
                                    <li><a target="_blank" href="email-template/email-confirmation.html" class="site-nav">Mail Confirmation</a></li>
                                    <li><a target="_blank" href="email-template/email-promotional1.html" class="site-nav">Mail Promotional 1</a></li>
                                    <li><a target="_blank" href="email-template/email-promotional2.html" class="site-nav last">Mail Promotional 2</a></li>
                                </ul>
                            </li>
                            <li><a href="#" class="site-nav">Elements <i class="an an-plus-l"></i></a>
                                <ul>
                                    <li><a href="elements-typography.html" class="site-nav">Typography</a></li>
                                    <li><a href="elements-buttons.html" class="site-nav">Buttons</a></li>
                                    <li><a href="elements-titles.html" class="site-nav">Titles</a></li>
                                    <li><a href="elements-banner-styles.html" class="site-nav">Banner Styles</a></li>
                                    <li><a href="elements-testimonial.html" class="site-nav">Testimonial</a></li>
                                    <li><a href="elements-accordions.html" class="site-nav">Accordions</a></li>
                                    <li><a href="elements-icons.html" class="site-nav">Icons</a></li>
                                    <li><a href="elements-blog-posts.html" class="site-nav">Blog Posts</a></li>
                                    <li><a href="elements-product.html" class="site-nav">Product</a></li> 
                                    <li><a href="elements-product-tab.html" class="site-nav">Product Tab</a></li> 
                                    <li><a href="elements-top-info-bar.html" class="site-nav">Top Info Bar</a></li>
                                    <li><a href="elements-top-promo-bar.html" class="site-nav last">Top Promo Bar</a></li>
                                </ul>
                            </li>
                        </ul>
                    </li>
                    <li class="lvl1 parent megamenu"><a href="#">Pages <i class="an an-plus-l"></i></a>
                        <ul>
                            <li><a href="aboutus-style1.html" class="site-nav">About Us <i class="an an-plus-l"></i></a>
                                <ul class="dropdown">
                                    <li><a href="aboutus-style1.html" class="site-nav">About Us Style1</a></li>
                                    <li><a href="aboutus-style2.html" class="site-nav">About Us Style2</a></li>
                                    <li><a href="aboutus-style3.html" class="site-nav last">About Us Style3</a></li>
                                </ul>
                            </li>
                            <li><a href="contact-style1.html" class="site-nav">Contact Us <i class="an an-plus-l"></i></a>
                                <ul class="dropdown">
                                    <li><a href="contact-style1.html" class="site-nav">Contact Us Style1</a></li>
                                    <li><a href="contact-style2.html" class="site-nav last">Contact Us Style2</a></li>
                                </ul>
                            </li>
                            <li><a href="lookbook-2columns.html" class="site-nav">Lookbook <i class="an an-plus-l"></i></a>
                                <ul class="dropdown">
                                    <li><a href="lookbook-2columns.html" class="site-nav">2 Columns</a></li>
                                    <li><a href="lookbook-3columns.html" class="site-nav">3 Columns</a></li>
                                    <li><a href="lookbook-4columns.html" class="site-nav">4 Columns</a></li>
                                    <li><a href="lookbook-5columns.html" class="site-nav">5 Columns + Fullwidth</a></li>
                                    <li><a href="lookbook-shop.html" class="site-nav last">Lookbook Shop</a></li>
                                </ul>
                            </li>
                            <li><a href="faqs-style1.html" class="site-nav">FAQs <i class="an an-plus-l"></i></a>
                                <ul class="dropdown">
                                    <li><a href="faqs-style1.html" class="site-nav">FAQs Style1</a></li>
                                    <li><a href="faqs-style2.html" class="site-nav last">FAQs Style2</a></li>
                                </ul>
                            </li>
                            <li><a href="brands-style1.html" class="site-nav">Brands <i class="an an-plus-l"></i></a>
                                <ul class="dropdown">
                                    <li><a href="brands-style1.html" class="site-nav">Brands Style1</a></li>
                                    <li><a href="brands-style2.html" class="site-nav last">Brands Style2</a></li>
                                </ul>
                            </li>
                            <li><a href="my-account.html" class="site-nav">My Account <i class="an an-plus-l"></i></a>
                                <ul class="dropdown">
                                    <li><a href="my-account.html" class="site-nav">My Account</a></li>
                                    <li><a href="login-sliding-style.html" class="site-nav">Login Sliding Slideshow</a></li>
                                    <li><a href="login.html" class="site-nav">Login</a></li>
                                    <li><a href="register.html" class="site-nav">Register</a></li>
                                    <li><a href="forgot-password.html" class="site-nav">Forgot Password</a></li>
                                    <li><a href="change-password.html" class="site-nav last">Change Password</a></li>
                                </ul>
                            </li>
                            <li><a href="#" class="site-nav">Empty Pages <i class="an an-plus-l"></i></a>
                                <ul class="dropdown">
                                    <li><a href="empty-category.html" class="site-nav">Empty Category</a></li>
                                    <li><a href="empty-cart.html" class="site-nav">Empty Cart</a></li>
                                    <li><a href="empty-compare.html" class="site-nav">Empty Compare</a></li>
                                    <li><a href="empty-wishlist.html" class="site-nav">Empty Wishlist</a></li>
                                    <li><a href="empty-search.html" class="site-nav last">Empty Search</a></li>
                                </ul>
                            </li>
                            <li><a href="error-404.html" class="site-nav">Error 404 </a></li>
                            <li><a href="cms-page.html" class="site-nav">CMS Page</a></li>
                            <li><a href="elements-icons.html" class="site-nav">Icons</a></li>
                            <li><a href="coming-soon.html" class="site-nav last">Coming soon <span class="lbl nm_label2">New</span></a></li>
                        </ul>
                    </li>
                    <li class="lvl1 parent megamenu"><a href="blog-left-sidebar.html">Blog <i class="an an-plus-l"></i></a>
                        <ul>
                            <li><a href="blog-left-sidebar.html" class="site-nav">Left Sidebar</a></li>
                            <li><a href="blog-right-sidebar.html" class="site-nav">Right Sidebar</a></li>
                            <li><a href="blog-fullwidth.html" class="site-nav">Fullwidth</a></li>
                            <li><a href="blog-masonry.html" class="site-nav">Masonry Blog Style</a></li>
                            <li><a href="blog-2columns.html" class="site-nav">2 Columns</a></li>
                            <li><a href="blog-3columns.html" class="site-nav">3 Columns</a></li>
                            <li><a href="blog-4columns.html" class="site-nav">4 Columns</a></li>
                            <li><a href="blog-single-post.html" class="site-nav last">Article Page</a></li>
                        </ul>
                    </li>
                    <li class="acLink"></li>
                    <li class="lvl1 bottom-link"><a href="login.html">Login</a></li>
                    <li class="lvl1 bottom-link"><a href="register.html">Signup</a></li>
                    <li class="lvl1 bottom-link"><a href="my-wishlist.html">Wishlist</a></li>
                    <li class="lvl1 bottom-link"><a href="compare-style1.html">Compare</a></li>
                    <li class="help bottom-link"><b>NEED HELP?</b><br>Call: +41 525 523 5687</li>
                </ul>
            </div>
            <!--End Mobile Menu-->

            <!--Body Container-->
            <div id="page-content">
                <!--Home Slider-->
                <section class="slideshow slideshow-wrapper">
                    <div class="home-slideshow">
                        <div class="slide slide1">
                            <div class="slideshow--large bg-size">
                                <img class="bg-img blur-up lazyload" data-src="resources/assets/images/slideshow/hand1920.jpg" src="resources/assets/images/slideshow/hand1920.jpg" alt="slideshow" title="" />
                                <div class="container">
                                    <div class="slideshow-content slideshow-overlay middle container d-flex justify-content-center align-items-center">
                                        <div class="slideshow-content-in text-center">
                                            <div class="wrap-caption animation style2 whiteText">
                                                <p class="ss-small-title mb-1">FRESH ADDITION</p>
                                                <h2 class="mega-title ss-mega-title">Billy A Dream</h2>
                                                <span class="mega-subtitle ss-sub-title">Experience it at a minimum cost</span>
                                                <div class="ss-btnWrap">
                                                    <a class="btn btn-lg rounded-0 btn-outline-primary" href="#">RENT EVERTHING</a>
                                                    <a class="btn btn-lg rounded-0 btn-outline-primary ms-2 ms-md-3" href="#">WHAT YOU WANT</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <!--End Home Slider-->

                <!--Store Feature-->
                <!-- <section class="section store-features">
                    <div class="container">
                        <div class="row store-info">
                            <div class="col-12 col-sm-6 col-md-6 col-lg-3 mb-3 my-lg-0">
                                <a class="d-flex clr-none" href="#">
                                    <div class="icon"><img class="w-100 blur-up lazyload" data-src="resources/assets/images/icon-img/70x70.png" src="resources/assets/images/icon-img/70x70.png" alt="image" width="60" /></div>
                                    <div class="detail">
                                        <h5 class="fs-6 fw-bold mb-1 body-font">Assured Quality</h5>
                                        <p class="sub-text">We provide quality products and sale after service</p>
                                    </div>
                                </a>
                            </div>
                            <div class="col-12 col-sm-6 col-md-6 col-lg-3 mb-3 my-lg-0">
                                <a class="d-flex clr-none" href="#">
                                    <div class="icon"><img class="w-100 blur-up lazyload" data-src="resources/assets/images/icon-img/70x70.png" src="resources/assets/images/icon-img/70x70.png" alt="image" width="60" /></div>
                                    <div class="detail">
                                        <h5 class="fs-6 fw-bold mb-1 body-font">Free Maintenance</h5>
                                        <p class="sub-text">We don't charge for normal wear and tear</p>
                                    </div>
                                </a>
                            </div>
                            <div class="col-12 col-sm-6 col-md-6 col-lg-3 mb-3 mb-md-0 my-lg-0">
                                <a class="d-flex clr-none" href="#">
                                    <div class="icon"><img class="w-100 blur-up lazyload" data-src="resources/assets/images/icon-img/70x70.png" src="resources/assets/images/icon-img/70x70.png" alt="image" width="60" /></div>
                                    <div class="detail">
                                        <h5 class="fs-6 fw-bold mb-1 body-font">1 Million Customers</h5>
                                        <p class="sub-text">We provide quality products and sale after service</p>
                                    </div>
                                </a>
                            </div>
                            <div class="col-12 col-sm-6 col-md-6 col-lg-3 mb-0 my-lg-0">
                                <a class="d-flex clr-none" href="#">
                                    <div class="icon"><img class="w-100 blur-up lazyload" data-src="resources/assets/images/icon-img/70x70.png" src="resources/assets/images/icon-img/70x70.png" alt="image" width="60" /></div>
                                    <div class="detail">
                                        <h5 class="fs-6 fw-bold mb-1 body-font">Multiple Award Winner</h5>
                                        <p class="sub-text">We provide quality products and sale after service</p>
                                    </div>
                                </a>
                            </div>
                        </div>
                    </div>
                </section> -->
                <!--End Store Feature-->
					
                <!--Banner Masonary-->
                <!-- 
                <section class="section collection-banners style8 mt-0">
                    <div class="container">
                        <div class="grid-masonary banner-grid grid-mr-20">
                            <div class="grid-sizer col-12 col-sm-12 col-md-6 col-lg-6 mw-100"></div>
                            <div class="row mx-0">
                                <div class="col-12 col-sm-12 col-md-6 col-lg-6 mw-100 cl-item banner-item">
                                    <div class="collection-grid-item banner1">
                                        <a href="shop-right-sidebar.html">
                                            <div class="img"><img class="rounded-2 blur-up lazyload" data-src="resources/assets/images/collection/demo20-dining-set.jpg" src="resources/assets/images/collection/demo20-dining-set.jpg" alt="collection" title="" /></div>
                                            <div class="details center-left bg-transparent">
                                                <div class="inner">
                                                    <p class="subtitle fs-5 lh-1 mb-3">To make bond over meals</p>
                                                    <h3 class="title lh-1 fw-bold">Dining Set</h3>
                                                    <span class="btn--link mt-4 small--hide">BUY NOW</span>
                                                </div>
                                            </div>
                                        </a>
                                    </div>
                                </div>
                                <div class="col-12 col-sm-12 col-md-6 col-lg-6 mw-100 cl-item banner-item">
                                    <div class="collection-grid-item banner2">
                                        <a href="shop-right-sidebar.html">
                                            <div class="img"><img class="rounded-2 blur-up lazyload" data-src="resources/assets/images/collection/demo20-modular-furniture.jpg" src="resources/assets/images/collection/demo20-modular-furniture.jpg" alt="collection" title="" /></div>
                                            <div class="details center-right bg-transparent">
                                                <div class="inner text-black">
                                                    <h3 class="title lh-1 fw-bold">Modular <br> Furniture</h3>
                                                    <p class="subtitle lh-1 mt-3 mb-0">FLAT 30% OFF</p>
                                                </div>
                                            </div>
                                        </a>
                                    </div>
                                </div>
                                <div class="col-12 col-sm-12 col-md-6 col-lg-6 mw-100 cl-item banner-item">
                                    <div class="collection-grid-item banner3">
                                        <a href="shop-right-sidebar.html">
                                            <div class="img"><img class="rounded-2 blur-up lazyload" data-src="resources/assets/images/collection/demo20-sofa-cumbed.jpg" src="resources/assets/images/collection/demo20-sofa-cumbed.jpg" alt="collection" title="" /></div>
                                            <div class="details top-left bg-transparent">
                                                <div class="inner">
                                                    <h3 class="title lh-1 fw-bold">Sofa cum Bed</h3>
                                                    <p class="subtitle lh-1 mb-0">Up to 40% Off</p>
                                                    <span class="btn--link mt-4 small--hide">SHOP NOW</span>
                                                </div>
                                            </div>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                 -->
                <!--End Banner Masonary-->
                
                
                <%	
				//파일이 업로드 된 곳에 접근해서 가져오고 싶을 땐 jsp에서는 application 객체를 사용항
				//컨트롤러 java 파일에서 업로드 하고자 하는 경로를 얻고싶을 땐 ServletContext 타입의 참조변수를 Autowired해서 사용
				String apath = application.getContextPath() + "/resources";
				// /ex/resources
				%>
				
              	 <%--  
               	<img src="<%=apath%>/0bbdc39f-dc1f-4dee-bc5b-2fa396f5a9b5_샤인머스켓.PNG" width="180px" height="180px"/>
				<img src="<%=apath%>/defb4815-5245-46fe-baa6-080795050e2a_사과.jpg" width="180px" height="180px"/> 
				--%>

				<%-- ${fn:length(recentProductList)}

				<c:forEach var="rProduct" items="${recentProductList}">
					${rProduct.images}

					<img src="<%=apath%>/${fn:split(rProduct.images,',')[0]}" width="180px" height="180px"/>					
					
										
					
				</c:forEach> --%>
				
				
				<!-- <div class="container">
				  <div class="row">
				    <div class="col">
				    col
				    </div>
				    
				    <div class="col">
				    col
				    </div>
				    
				    <div class="col">
				    col
				    </div>
				    
				    <div class="col">
				    col
				    </div>
				  </div>
				</div>	 -->
					
					
				
				<div class="container">
				
					<div class="section-header">
                            <h2 style="font-family: 'Poppins',Arial,Tahoma !important; font-weight: 700!important; font-size:25px  ;color: black; margin-top:50px">최근 올라온 상품</h2>
                    </div>
                     
					<c:set var="notCeiledQuotient" value="${fn:length(recentProductList)/4}"/> 
					<%-- notCeiledQuotient : ${notCeiledQuotient} <br> --%>
					<c:set var="ceiledQuotient" value="${(notCeiledQuotient + (1 - (notCeiledQuotient % 1)) % 1)}"/> 
					<%-- ceiledQuotient : ${ceiledQuotient} <br> --%>
					
					<c:forEach var="i" begin="1" end="${ceiledQuotient * 4}" step="1">
						<c:if test="${i % 4 eq 1}">
							<div class="grid-products row">
						</c:if>
							
						<!-- 비어있는 이미지 출력 -->
						<c:if test="${i > fn:length(recentProductList)}">
							<div class="item col">
	                        </div>
						</c:if>
						
						<!-- 정상적인 이미지 출력 -->
						<c:if test="${i <= fn:length(recentProductList)}">
							<div class="item col">
	                        	<!--Start Product Image-->
	                            <div class="product-image">
	                                    <!--Start Product Image-->
	                                    <a href="productdetail.prd?no=${recentProductList[i-1].no}" class="product-img">
	                                        <!--Image-->
	                                        <img class="primary blur-up lazyload" data-src="<%=apath%>/${fn:split(recentProductList[i-1].images,',')[0]}" src="<%=apath%>/${fn:split(recentProductList[i-1].images,',')[0]}" alt="image" title="" style="height:300px"/>
	                                        <!--End Image-->
	                                        <!--Hover Image-->
	                                        <img class="hover blur-up lazyload" data-src="<%=apath%>/${fn:split(recentProductList[i-1].images,',')[0]}" src="<%=apath%>/${fn:split(recentProductList[i-1].images,',')[0]}" alt="image" title="" style="height:300px"/>
	                                        <!--End Hover Image-->
	                                    </a>
	                                    <!-- End Product Image -->
	                                    
	                                    <!--Product label-->
	                                    <div class="product-labels"><span class="lbl on-sale rounded-2" style="background:#489CFF">New</span></div>
	                                    <!--End Product label-->
	                                    
	                                    <!--Product Button-->
	                                    <div class="button-set style0 d-none d-md-block">
	                                        <ul>
	                                            <!--Wishlist Button-->
	                                            <li><a class="btn-icon wishlist add-to-wishlist" href="javascript:like(${recentProductList[i-1].no})"><i class="icon an an-heart-l" ></i> <span class="tooltip-label top">Add To Wishlist</span></a></li>
	                                            <!--End Wishlist Button-->
	                                        </ul>
	                                    </div>
	                                    <!--End Product Button-->
	                                </div>
	                                <!-- End Product Image -->
	                                
	                                
	                                
	                                <!--Start Product Details-->
	                                <div class="product-details text-center">
	                                    <!--Product Name-->
	                                    <div class="product-name">
	                                        <a class="text-uppercase fw-normal" href="productdetail.prd?no=${recentProductList[i-1].no}">${recentProductList[i-1].name}</a>
	                                    </div>
	                                    <!--End Product Name-->
	                                    <!--Product Price-->
	                                    <div class="product-price">
	                                        <span class="old-price"><fmt:formatNumber value="${recentProductList[i-1].original_day_price}" pattern="#,###" />원/일</span> 
	                                        <%-- <span class="old-price" style="text-decoration : none">${recentProductList[i-1].add1_sido} ${recentProductList[i-1].add2_sigungu} ${recentProductList[i-1].add3_eubmyeon} ${recentProductList[i-1].add4_donglee}</span> --%>
	                                        <span class="price"><fmt:formatNumber value="${recentProductList[i-1].discounted_day_price}" pattern="#,###" />원/일</span> 
	                                    </div>
	                                    <!-- End Product Price-->
	                                    <!--Product Review-->
	                                    <div class="product-review m-0">
	                                    <!-- <i class="an an-star"></i><i class="an an-star"></i><i class="an an-star"></i><i class="an an-star-o"></i><i class="an an-star-o"></i> -->
	                                    <span class="old-price" style="text-decoration : none">
	                                    
	                                    <c:if test="${recentProductList[i-1].add1_sido ne ''}">
	                                    	${recentProductList[i-1].add1_sido}
	                                    </c:if>
	                                    
	                                    <c:if test="${recentProductList[i-1].add2_sigungu ne ''}">
	                                    	${recentProductList[i-1].add2_sigungu}
	                                    </c:if>
	                                    
	                                    <c:if test="${recentProductList[i-1].add3_eubmyeon ne ''}">
	                                    	${recentProductList[i-1].add3_eubmyeon}
	                                    </c:if>
	                                    
	                                    <c:if test="${recentProductList[i-1].add4_donglee ne ''}">
	                                    	${recentProductList[i-1].add4_donglee}
	                                    </c:if>
	                                    
	                                    <%-- ${recentProductList[i-1].add1_sido} ${recentProductList[i-1].add2_sigungu} ${recentProductList[i-1].add3_eubmyeon} ${recentProductList[i-1].add4_donglee} --%>
	                                    </span>
	                                    </div>
	                                    <!--End Product Review-->
	                                </div>
	                                <!--End Product Details-->
                           		 </div>
						</c:if>
						
						<c:if test="${i % 4 eq 0}">
							</div>
						</c:if>	
						
					</c:forEach>
				</div>
				
				<center>
					<div>
					<input type="button" value="더보기" id="more_see" style="width:15%; margin-top:10px" onClick="location.href='newOrPopularClicked.prd?whatColumn=new'">
					</div>
				</center>
				
				<div class="container">
				
					<div class="section-header">
                            <h2 style="font-family: 'Poppins',Arial,Tahoma !important; font-weight: 700!important; font-size:25px  ;color: black; margin-top:50px">인기 상품</h2>
                    </div>
                    
					<c:set var="notCeiledQuotient" value="${fn:length(popularProductList)/4}"/> 
					<%-- notCeiledQuotient : ${notCeiledQuotient} <br> --%>
					<c:set var="ceiledQuotient" value="${(notCeiledQuotient + (1 - (notCeiledQuotient % 1)) % 1)}"/> 
					<%-- ceiledQuotient : ${ceiledQuotient} <br> --%>
					
					<c:forEach var="i" begin="1" end="${ceiledQuotient * 4}" step="1">
						<c:if test="${i % 4 eq 1}">
							<div class="grid-products row">
						</c:if>
							
						<!-- 비어있는 이미지 출력 -->
						<c:if test="${i > fn:length(popularProductList)}">
							<div class="item col">
	                        </div>
						</c:if>
						
						<!-- 정상적인 이미지 출력 -->
						<c:if test="${i <= fn:length(popularProductList)}">
							<div class="item col">
	                        	<!--Start Product Image-->
	                            <div class="product-image">
	                                    <!--Start Product Image-->
	                                    <a href="productdetail.prd?no=${popularProductList[i-1].no}" class="product-img">
	                                        <!--Image-->
	                                        <img class="primary blur-up lazyload" data-src="<%=apath%>/${fn:split(popularProductList[i-1].images,',')[0]}" src="<%=apath%>/${fn:split(popularProductList[i-1].images,',')[0]}" alt="image" title="" style="height:300px"/>
	                                        <!--End Image-->
	                                        <!--Hover Image-->
	                                        <img class="hover blur-up lazyload" data-src="<%=apath%>/${fn:split(popularProductList[i-1].images,',')[0]}" src="<%=apath%>/${fn:split(popularProductList[i-1].images,',')[0]}" alt="image" title="" style="height:300px"/>
	                                        <!--End Hover Image-->
	                                    </a>
	                                    <!-- End Product Image -->
	                                    
	                                    <!--Product label-->
	                                    <div class="product-labels"><span class="lbl on-sale rounded-2">Hot</span></div>
	                                    <!--End Product label-->
	                                    
	                                    <!--Product Button-->
	                                    <div class="button-set style0 d-none d-md-block">
	                                        <ul>
	                                            <!--Wishlist Button-->
	                                            <li><a class="btn-icon wishlist add-to-wishlist" href="javascript:like(${popularProductList[i-1].no})"><i class="icon an an-heart-l"></i> <span class="tooltip-label top">Add To Wishlist</span></a></li>
	                                            <!--End Wishlist Button-->
	                                            
	                                        </ul>
	                                    </div>
	                                    <!--End Product Button-->
	                                </div>
	                                <!-- End Product Image -->
	                                
	                                
	                                
	                                <!--Start Product Details-->
	                                <div class="product-details text-center">
	                                    <!--Product Name-->
	                                    <div class="product-name">
	                                        <a class="text-uppercase fw-normal" href="productdetail.prd?no=${popularProductList[i-1].no}">${popularProductList[i-1].name}</a>
	                                    </div>
	                                    <!--End Product Name-->
	                                    <!--Product Price-->
	                                    <div class="product-price">
	                                        <span class="old-price"><fmt:formatNumber value="${popularProductList[i-1].original_day_price}" pattern="#,###" />원/일</span> 
	                                        <%-- <span class="old-price" style="text-decoration : none">${popularProductList[i-1].add1_sido} ${popularProductList[i-1].add2_sigungu} ${popularProductList[i-1].add3_eubmyeon} ${popularProductList[i-1].add4_donglee}</span> --%>
	                                        <span class="price"><fmt:formatNumber value="${popularProductList[i-1].discounted_day_price}" pattern="#,###" />원/일</span> 
	                                    </div>
	                                    <!-- End Product Price-->
	                                    <!--Product Review-->
	                                    <div class="product-review m-0">
	                                    <!-- <i class="an an-star"></i><i class="an an-star"></i><i class="an an-star"></i><i class="an an-star-o"></i><i class="an an-star-o"></i> -->
	                                    <span class="old-price" style="text-decoration : none">
	                                    
	                                    <c:if test="${popularProductList[i-1].add1_sido ne ''}">
	                                    	${popularProductList[i-1].add1_sido}
	                                    </c:if>
	                                    
	                                    <c:if test="${popularProductList[i-1].add2_sigungu ne ''}">
	                                    	${popularProductList[i-1].add2_sigungu}
	                                    </c:if>
	                                    
	                                    <c:if test="${popularProductList[i-1].add3_eubmyeon ne ''}">
	                                    	${popularProductList[i-1].add3_eubmyeon}
	                                    </c:if>
	                                    
	                                    <c:if test="${popularProductList[i-1].add4_donglee ne ''}">
	                                    	${popularProductList[i-1].add4_donglee}
	                                    </c:if>
	                                    
	                                    <%-- ${popularProductList[i-1].add1_sido} ${popularProductList[i-1].add2_sigungu} ${popularProductList[i-1].add3_eubmyeon} ${popularProductList[i-1].add4_donglee} --%>
	                                    </span>
	                                    </div>
	                                    <!--End Product Review-->
	                                </div>
	                                <!--End Product Details-->
                           		 </div>
						</c:if>
						
						<c:if test="${i % 4 eq 0}">
							</div>
						</c:if>	
						
					</c:forEach>
				</div>
				
				<center>
					<div>
					<input type="button" value="더보기" id="more_see" style="width:15%; margin-top:10px; margin-bottom:20px" onClick="location.href='newOrPopularClicked.prd?whatColumn=hot'">
					</div>
				</center>
				
				
                <%-- <!--Product Slider-->
                <section class="section product-slider pt-0">
                    <div class="container">
                    
                        <div class="section-header">
                            <h2>최근 올라온 상품</h2>
                        </div>
                        
                        <div class="productSlider grid-products">
                        
                        	<c:forEach var="rProduct" items="${recentProductList}" varStatus="status">
								${rProduct.images}
		
								<img src="<%=apath%>/${fn:split(rProduct.images,',')[0]}" width="180px" height="180px"/>					
							
							
							 	<div class="item">
                                <!--Start Product Image-->
                                <div class="product-image">
                                    <!--Start Product Image-->
                                    <a href="product-layout1.html" class="product-img">
                                        <!--Image-->
                                        <img class="primary blur-up lazyload" data-src="<%=apath%>/${fn:split(rProduct.images,',')[0]}" src="<%=apath%>/${fn:split(rProduct.images,',')[0]}" alt="image" title="" />
                                        <!--End Image-->
                                        <!--Hover Image-->
                                        <img class="hover blur-up lazyload" data-src="<%=apath%>/${fn:split(rProduct.images,',')[0]}" src="<%=apath%>/${fn:split(rProduct.images,',')[0]}" alt="image" title="" />
                                        <!--End Hover Image-->
                                    </a>
                                    <!-- End Product Image -->
                                    
                                    <!--Product label-->
                                    <div class="product-labels"><span class="lbl on-sale rounded-2">New</span></div>
                                    <!--End Product label-->
                                    
                                    <!--Product Button-->
                                    <div class="button-set style0 d-none d-md-block">
                                        <ul>
                                            <!--Cart Button-->
                                            <li><a class="btn-icon btn cartIcon pro-addtocart-popup" href="#pro-addtocart-popup"><i class="icon an an-cart-l"></i> <span class="tooltip-label top">Add to Cart</span></a></li>
                                            <!--End Cart Button-->
                                            <!--Quick View Button-->
                                            <li><a class="btn-icon quick-view-popup quick-view" href="javascript:void(0)" data-toggle="modal" data-target="#content_quickview"><i class="icon an an-search-l"></i> <span class="tooltip-label top">Quick View</span></a></li>
                                            <!--End Quick View Button-->
                                            <!--Wishlist Button-->
                                            <li><a class="btn-icon wishlist add-to-wishlist" href="my-wishlist.html"><i class="icon an an-heart-l"></i> <span class="tooltip-label top">Add To Wishlist</span></a></li>
                                            <!--End Wishlist Button-->
                                            <!--Compare Button-->
                                            <li><a class="btn-icon compare add-to-compare" href="compare-style2.html"><i class="icon an an-sync-ar"></i> <span class="tooltip-label top">Add to Compare</span></a></li>
                                            <!--End Compare Button-->
                                        </ul>
                                    </div>
                                    <!--End Product Button-->
                                    
                                </div>
                                <!-- End Product Image -->
                                
                                <!--Start Product Details-->
                                <div class="product-details text-center">
                                    <!--Product Name-->
                                    <div class="product-name">
                                        <a class="text-uppercase fw-normal" href="product-layout1.html">Black Flower Vase</a>
                                    </div>
                                    <!--End Product Name-->
                                    <!--Product Price-->
                                    <div class="product-price">
                                        <span class="old-price">$100.00</span> <span class="price">$70.00</span>
                                    </div>
                                    <!-- End Product Price-->
                                    <!--Product Review-->
                                    <div class="product-review m-0"><i class="an an-star"></i><i class="an an-star"></i><i class="an an-star"></i><i class="an an-star-o"></i><i class="an an-star-o"></i></div>
                                    <!--End Product Review-->
                                </div>
                                <!--End Product Details-->
                           		 </div>
							</c:forEach>
                        </div>
                        
                        
                    </div>
                </section>
                <!--End Product Slider--> --%>

                <!--Collections Grid-->
                <!-- 
                <section class="section collection-grids pt-0">
                    <div class="container">
                        <div class="section-header">
                            <h2 class="text-transform-none">Shop Your Favorite</h2>
                            <p>Impressive Collection for Your Dream Home</p>
                        </div>
                        <div class="row grid-categorys">
                            <div class="col-12 col-sm-6 col-md-6 col-lg-6 category-grid-item mb-3">
                                <div class="category-item zoomscal-hov">
                                    <a href="shop-left-sidebar.html" class="category-link text-center clr-none">
                                        <div class="zoom-scal"><img class="blur-up lazyload" data-src="resources/assets/images/collection/demo20-carpet.jpg" src="resources/assets/images/collection/demo20-carpet.jpg" alt="collection" title="" /></div>
                                        <div class="details text-left px-0">
                                            <div class="inner">
                                                <h3 class="category-title">Carpets and Rugs</h3>
                                                <p class="mt-1">Matching carpets for every occasion.</p>
                                            </div>
                                        </div>
                                    </a>
                                </div>
                            </div>
                            <div class="col-12 col-sm-6 col-md-6 col-lg-6 category-grid-item mb-3">
                                <div class="category-item zoomscal-hov">
                                    <a href="shop-left-sidebar.html" class="category-link text-center clr-none">
                                        <div class="zoom-scal"><img class="blur-up lazyload" data-src="resources/assets/images/collection/demo20-carpet.jpg" src="resources/assets/images/collection/demo20-carpet.jpg" alt="collection" title="" /></div>
                                        <div class="details text-left px-0">
                                            <div class="inner">
                                                <h3 class="category-title">Prefect Mattress</h3>
                                                <p class="mt-1">Give your body the comfort it deserves</p>
                                            </div>
                                        </div>
                                    </a>
                                </div>
                            </div>
                            <div class="col-12 col-sm-6 col-md-4 col-lg-4 category-grid-item mb-3">
                                <div class="category-item zoomscal-hov">
                                    <a href="shop-left-sidebar.html" class="category-link text-center clr-none">
                                        <div class="zoom-scal"><img class="blur-up lazyload" data-src="resources/assets/images/collection/demo20-book.jpg" src="resources/assets/images/collection/demo20-book.jpg" alt="collection" title="" /></div>
                                        <div class="details text-left px-0">
                                            <div class="inner">
                                                <h3 class="category-title">Book Shelves</h3>
                                                <p class="mt-1">Perfectly clean cabinet that will reflect your style</p>
                                            </div>
                                        </div>
                                    </a>
                                </div>
                            </div>
                            <div class="col-12 col-sm-6 col-md-4 col-lg-4 category-grid-item mb-3">
                                <div class="category-item zoomscal-hov">
                                    <a href="shop-left-sidebar.html" class="category-link text-center clr-none">
                                        <div class="zoom-scal"><img class="blur-up lazyload" data-src="resources/assets/images/collection/demo20-book.jpg" src="resources/assets/images/collection/demo20-book.jpg" alt="collection" title="" /></div>
                                        <div class="details text-left px-0">
                                            <div class="inner">
                                                <h3 class="category-title">Study Tables</h3>
                                                <p class="mt-1">Provides the assurance of comfort</p>
                                            </div>
                                        </div>
                                    </a>
                                </div>
                            </div>
                            <div class="col-12 col-sm-6 col-md-4 col-lg-4 category-grid-item mb-3">
                                <div class="category-item zoomscal-hov">
                                    <a href="shop-left-sidebar.html" class="category-link text-center clr-none">
                                        <div class="zoom-scal"><img class="blur-up lazyload" data-src="resources/assets/images/collection/demo20-book.jpg" src="resources/assets/images/collection/demo20-book.jpg" alt="collection" title="" /></div>
                                        <div class="details text-left px-0">
                                            <div class="inner">
                                                <h3 class="category-title">Lamps &amp; Lightings</h3>
                                                <p class="mt-1">Ideal solutions for your dark evenings</p>
                                            </div>
                                        </div>
                                    </a>
                                </div>
                            </div>
                            <div class="col-12 col-sm-6 col-md-8 col-lg-8 category-grid-item mb-3 mb-sm-0">
                                <div class="category-item zoomscal-hov">
                                    <a href="shop-left-sidebar.html" class="category-link text-center clr-none">
                                        <div class="zoom-scal"><img class="blur-up lazyload" data-src="resources/assets/images/collection/demo20-traditional.jpg" src="resources/assets/images/collection/demo20-traditional.jpg" alt="collection" title="" /></div>
                                        <div class="details text-left px-0 pb-md-0">
                                            <div class="inner">
                                                <h3 class="category-title">Traditional Furniture</h3>
                                                <p class="mt-1">Old furniture is always gold</p>
                                            </div>
                                        </div>
                                    </a>
                                </div>
                            </div>
                            <div class="col-12 col-sm-6 col-md-4 col-lg-4 category-grid-item mb-0">
                                <div class="category-item zoomscal-hov">
                                    <a href="shop-left-sidebar.html" class="category-link text-center clr-none">
                                        <div class="zoom-scal"><img class="blur-up lazyload" data-src="resources/assets/images/collection/demo20-home-decor.jpg" src="resources/assets/images/collection/demo20-home-decor.jpg" alt="collection" title="" /></div>
                                        <div class="details text-left px-0 pb-md-0">
                                            <div class="inner">
                                                <h3 class="category-title">Home DÃ©cor</h3>
                                                <p class="mt-1">All you need to create your space</p>
                                            </div>
                                        </div>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                 -->
                <!--End Collections Grid-->

                <!--Testimonial Slider-->
                <!-- 
                <section class="section testimonial-slider style1">
                    <div class="container">
                        <div class="row">
                            <div class="col-12 section-header style1">
                                <div class="section-header-left">
                                    <h2>Their Words, Our Pride</h2>
                                </div>
                            </div>
                        </div>
                        <div class="quote-wraper">
                            
                            <div class="quotes-slider arwOut3">
                                <div class="quotes-slide">
                                    <blockquote class="quotes-slider__text text-center">             
                                        <div class="testimonial-image"><img class="blur-up lazyload" data-src="resources/assets/images/testimonial-photo1.jpg" src="resources/assets/images/testimonial-photo1.jpg" alt="Shetty Jamie" title="Shetty Jamie" /></div>
                                        <div class="rte-setting"><p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.</p></div>
                                        <div class="product-review">
                                            <i class="an an-star"></i>
                                            <i class="an an-star"></i>
                                            <i class="an an-star"></i>
                                            <i class="an an-star"></i>
                                            <i class="an an-star"></i>
                                        </div>
                                        <p class="authour">Shetty Jamie,</p>
                                        <p class="cmp-name">Kollision</p>
                                    </blockquote>
                                </div>
                                <div class="quotes-slide">
                                    <blockquote class="quotes-slider__text text-center">             
                                        <div class="testimonial-image"><img class="blur-up lazyload" data-src="resources/assets/images/testimonial-photo1.jpg" src="resources/assets/images/testimonial-photo1.jpg" alt="Sara Colinton" title="Sara Colinton" /></div>
                                        <div class="rte-setting"><p>Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software PageMaker including versions readable content page.</p></div>
                                        <div class="product-review">
                                            <i class="an an-star"></i>
                                            <i class="an an-star"></i>
                                            <i class="an an-star"></i>
                                            <i class="an an-star"></i>
                                            <i class="an an-star"></i>
                                        </div>
                                        <p class="authour">Sara Colinton,</p>
                                        <p class="cmp-name">Pel</p>
                                    </blockquote>
                                </div>
                                <div class="quotes-slide">
                                    <blockquote class="quotes-slider__text text-center">             
                                        <div class="testimonial-image"><img class="blur-up lazyload" data-src="resources/assets/images/testimonial-photo1.jpg" src="resources/assets/images/testimonial-photo1.jpg" alt="Hamlet Tuong" title="Hamlet Tuong" /></div>
                                        <div class="rte-setting"><p>Scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic of remaining essentially 1960s.</p></div>
                                        <div class="product-review">
                                            <i class="an an-star"></i>
                                            <i class="an an-star"></i>
                                            <i class="an an-star"></i>
                                            <i class="an an-star"></i>
                                            <i class="an an-star gray-star"></i>
                                        </div>
                                        <p class="authour">Hamlet Tuong,</p>
                                        <p class="cmp-name">OPL</p>  
                                    </blockquote>
                                </div>
                                <div class="quotes-slide">
                                    <blockquote class="quotes-slider__text text-center">             
                                        <div class="testimonial-image"><img class="blur-up lazyload" data-src="resources/assets/images/testimonial-photo1.jpg" src="resources/assets/images/testimonial-photo1.jpg" alt="Shetty Jamie" title="Shetty Jamie" /></div>
                                        <div class="rte-setting"><p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum.</p></div>
                                        <div class="product-review">
                                            <i class="an an-star"></i>
                                            <i class="an an-star"></i>
                                            <i class="an an-star"></i>
                                            <i class="an an-star"></i>
                                            <i class="an an-star gray-star"></i>
                                        </div>
                                        <p class="authour">Happy Customer,</p>
                                        <p class="cmp-name">CPL</p>
                                    </blockquote>
                                </div>
                            </div>
                            
                        </div>
                    </div>
                </section>
                 -->
                <!--End Testimonial Slider-->

                <!--Brand Logo Slider-->
                <!-- 
                <section class="section logo-section">
                    <div class="container">
                        <div class="section-header">
                            <h2>Corporate Clientele</h2>
                        </div>
                        <div class="row">
                            <div class="col-12 col-sm-12 col-md-12 col-lg-12">
                                <div class="logo-bar">
                                    <div class="logo-bar__item">
                                        <a href="brands-style2.html"><img class="blur-up lazyload" data-src="resources/assets/images/logo/brandlogo1.png" src="resources/assets/images/logo/brandlogo1.png" alt="brand" title="" /></a>
                                    </div>
                                    <div class="logo-bar__item">
                                        <a href="brands-style2.html"><img class="blur-up lazyload" data-src="resources/assets/images/logo/brandlogo1.png" src="resources/assets/images/logo/brandlogo1.png" alt="brand" title="" /></a>
                                    </div>
                                    <div class="logo-bar__item">
                                        <a href="brands-style2.html"><img class="blur-up lazyload" data-src="resources/assets/images/logo/brandlogo1.png" src="resources/assets/images/logo/brandlogo1.png" alt="brand" title="" /></a>
                                    </div>
                                    <div class="logo-bar__item">
                                        <a href="brands-style2.html"><img class="blur-up lazyload" data-src="resources/assets/images/logo/brandlogo1.png" src="resources/assets/images/logo/brandlogo1.png" alt="brand" title="" /></a>
                                    </div>
                                    <div class="logo-bar__item">
                                        <a href="brands-style2.html"><img class="blur-up lazyload" data-src="resources/assets/images/logo/brandlogo1.png" src="resources/assets/images/logo/brandlogo1.png" alt="brand" title="" /></a>
                                    </div>
                                    <div class="logo-bar__item">
                                        <a href="brands-style2.html"><img class="blur-up lazyload" data-src="resources/assets/images/logo/brandlogo1.png" src="resources/assets/images/logo/brandlogo1.png" alt="brand" title="" /></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                -->
                <!--End Brand Logo Slider-->
            </div>
            <!--End Body Container-->

<%@include file="../member/commonBottom.jsp" %>     