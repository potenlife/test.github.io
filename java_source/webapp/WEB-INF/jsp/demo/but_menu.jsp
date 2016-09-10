<%@ page contentType="text/html;charset=UTF-8" %><%@taglib prefix="c" uri="/cloud-tags"%>
<h3 class="page-title">
	<c:mi key="findDemoMenuBut"/>
</h3>
<div class="page-bar">
	<c:navi key="findDemoMenuBut"/>  
</div>

<div class="row">
				<div class="col-md-12">
					<div class="tabbable-custom tabbable-full-width">
						<ul class="nav nav-tabs">
							<li class="active">
								<a href="#tab_1_1" data-toggle="tab">Square Buttons</a>
							</li>
							<li>
								<a href="#tab_1_2" data-toggle="tab">Circle Buttons <span class="label label-sm label-danger circle">new</span></a>
							</li>
						</ul>
						<div class="tab-content">
							<div class="tab-pane active" id="tab_1_1">
								<div class="row">
									<div class="col-md-6">
										<!-- BEGIN BUTTONS PORTLET-->
										<div class="portlet box green ">
											<div class="portlet-title">
												<div class="caption">
													<i class="fa fa-gift"></i>Buttons
												</div>
												<div class="tools">
													<a href="javascript:;" class="collapse">
													</a>
													<a href="#portlet-config" data-toggle="modal" class="config">
													</a>
													<a href="javascript:;" class="reload">
													</a>
													<a href="javascript:;" class="remove">
													</a>
												</div>
											</div>
											<div class="portlet-body util-btn-margin-bottom-5">
												<div class="clearfix">
													<h4 class="block">Default Bootstrap Buttons(Customized to Match Theme Style)</h4>
													<!-- Standard gray button with gradient -->
													<button type="button" class="btn btn-default">Default</button>
													<!-- Provides extra visual weight and identifies the primary action in a set of buttons -->
													<button type="button" class="btn btn-primary">Primary</button>
													<!-- Indicates a successful or positive action -->
													<button type="button" class="btn btn-success">Success</button>
													<!-- Contextual button for informational alert messages -->
													<button type="button" class="btn btn-info">Info</button>
													<!-- Indicates caution should be taken with this action -->
													<button type="button" class="btn btn-warning">Warning</button>
													<!-- Indicates a dangerous or potentially negative action -->
													<button type="button" class="btn btn-danger">Danger</button>
													<!-- Deemphasize a button by making it look like a link while maintaining button behavior -->
													<button type="button" class="btn btn-link">Link</button>
												</div>
												<div class="clearfix">
													<h4 class="block">Metronic Style Buttons</h4>
													<button type="button" class="btn default">Default</button>
													<button type="button" class="btn red">Red</button>
													<button type="button" class="btn blue">Blue</button>
													<button type="button" class="btn green">Green</button>
													<button type="button" class="btn yellow">Yellow</button>
													<button type="button" class="btn purple">Purple</button>
													<button type="button" class="btn dark">Dark</button>
												</div>
												<div class="clearfix">
													<h4 class="block">More Button Colors(go to <a href="ui_colors.html">
													ui_colors.html </a>
													for more colors)</h4>
													<button type="button" class="btn blue-hoki">Blue Hoki</button>
													<button type="button" class="btn blue-madison">Blue Madison</button>
													<button type="button" class="btn green-meadow">Green Meadow</button>
													<button type="button" class="btn red-sunglo">Red Sunglo</button>
													<button type="button" class="btn yellow-crusta">Yellow Crusta</button>
													<button type="button" class="btn purple-plum">Purple Plum</button>
													<button type="button" class="btn grey-cascade">Grey Cascade</button>
												</div>
												<div class="clearfix">
													<h4 class="block">Button Stripe</h4>
													<a href="#" class="btn default red-stripe">
													Red </a>
													<a href="#" class="btn default blue-stripe">
													Blue </a>
													<a href="#" class="btn default green-stripe">
													Green </a>
													<a href="#" class="btn default yellow-stripe">
													Yellow </a>
													<a href="#" class="btn default purple-stripe">
													Purple </a>
													<a href="#" class="btn default green-stripe">
													Green </a>
													<a href="#" class="btn default dark-stripe">
													Dark </a>
												</div>
												<div class="clearfix">
													<h4 class="block">Disabled</h4>
													<a href="#" class="btn default disabled">
													Default </a>
													<a href="#" class="btn red disabled">
													Red </a>
													<a href="#" class="btn blue disabled">
													Blue </a>
													<a href="#" class="btn green disabled">
													Green </a>
													<a href="#" class="btn yellow disabled">
													Yellow </a>
													<a href="#" class="btn purple disabled">
													Purple </a>
													<a href="#" class="btn dark disabled">
													Dark </a>
												</div>
												<div class="clearfix">
													<h4 class="block">Button Sizes</h4>
													<button type="button" class="btn default btn-lg">Large button</button>
													<button type="button" class="btn red">Default button</button>
													<button type="button" class="btn blue btn-sm">Small button</button>
													<button type="button" class="btn green btn-xs">Extra small button</button>
												</div>
												<div class="clearfix">
													<h4 class="block">Button Tags</h4>
													<a href="#" class="btn default">
													Link </a>
													<button class="btn default">Button</button>
													<input type="button" class="btn default" value="Input">
													<input type="submit" class="btn default" value="Submit">
												</div>
												<div class="clearfix">
													<h4 class="block">Block Buttons</h4>
													<a href="#" class="btn default btn-block">
													Link </a>
													<button class="btn blue btn-block">Button</button>
													<input type="button" class="btn red btn-block" value="Input">
													<input type="submit" class="btn purple btn-block" value="Submit">
												</div>
											</div>
										</div>
										<!-- END BUTTONS PORTLET-->
										<!-- BEGIN BUTTONS WITH ICONS PORTLET-->
										<div class="portlet box red-pink tabbable">
											<div class="portlet-title">
												<div class="caption">
													<i class="fa fa-gift"></i>
													<span class="hidden-480">
													Buttons </span>
												</div>
											</div>
											<div class="portlet-body util-btn-margin-bottom-5">
												<div class="portlet-tabs">
													<ul class="nav nav-tabs">
														<li>
															<a href="#buttons_metro" data-toggle="tab">
															Metro </a>
														</li>
														<li>
															<a href="#dropdown_glyphicon" data-toggle="tab">
															Glyphicon </a>
														</li>
														<li>
															<a href="#dropdown_simplelineicons" data-toggle="tab">
															Simple Line</a>
														</li>
														<li class="active">
															<a href="#dropdown_fontawesome" data-toggle="tab">
															Fontawesome </a>
														</li>
													</ul>
													<div class="tab-content">
														<div class="tab-pane active" id="dropdown_fontawesome">
															<div class="clearfix">
																<h4 class="block">Large Buttons</h4>
																<a href="#" class="btn btn-lg default">
																Default <i class="fa fa-user"></i>
																</a>
																<a href="#" class="btn btn-lg red">
																Red <i class="fa fa-edit"></i>
																</a>
																<a href="#" class="btn btn-lg blue">
																<i class="fa fa-file-o"></i> Blue </a>
																<a href="#" class="btn btn-lg green">
																Green <i class="fa fa-font"></i>
																</a>
																<a href="#" class="btn btn-lg yellow">
																Yellow <i class="fa fa-search"></i>
																</a>
																<a href="#" class="btn btn-lg purple">
																<i class="fa fa-times"></i> Purple </a>
																<a href="#" class="btn btn-lg green">
																Green <i class="fa fa-plus"></i>
																</a>
																<a href="#" class="btn btn-lg grey-cascade">
																Dark <i class="fa fa-link"></i>
																</a>
															</div>
															<div class="clearfix">
																<h4 class="block">Default Buttons</h4>
																<a href="#" class="btn default">
																Default <i class="fa fa-user"></i>
																</a>
																<a href="#" class="btn red">
																Red <i class="fa fa-edit"></i>
																</a>
																<a href="#" class="btn blue">
																<i class="fa fa-file-o"></i> Blue </a>
																<a href="#" class="btn green">
																Green <i class="fa fa-font"></i>
																</a>
																<a href="#" class="btn yellow">
																Yellow <i class="fa fa-search"></i>
																</a>
																<a href="#" class="btn purple">
																<i class="fa fa-times"></i> Purple </a>
																<a href="#" class="btn green">
																Green <i class="fa fa-plus"></i>
																</a>
																<a href="#" class="btn grey-cascade">
																Dark <i class="fa fa-link"></i>
																</a>
															</div>
															<div class="clearfix">
																<h4 class="block">Small Buttons</h4>
																<a href="#" class="btn btn-sm default">
																Default <i class="fa fa-user"></i>
																</a>
																<a href="#" class="btn btn-sm red">
																Red <i class="fa fa-edit"></i>
																</a>
																<a href="#" class="btn btn-sm blue">
																<i class="fa fa-file-o"></i> Blue </a>
																<a href="#" class="btn btn-sm green">
																Green <i class="fa fa-font"></i>
																</a>
																<a href="#" class="btn btn-sm yellow">
																Yellow <i class="fa fa-search"></i>
																</a>
																<a href="#" class="btn btn-sm purple">
																<i class="fa fa-times"></i> Purple </a>
																<a href="#" class="btn btn-sm green">
																Green <i class="fa fa-plus"></i>
																</a>
																<a href="#" class="btn btn-sm grey-cascade">
																Dark <i class="fa fa-link"></i>
																</a>
															</div>
															<div class="clearfix">
																<h4 class="block">Extra Small</h4>
																<a href="#" class="btn btn-xs default">
																Default <i class="fa fa-user"></i>
																</a>
																<a href="#" class="btn btn-xs red">
																Red <i class="fa fa-edit"></i>
																</a>
																<a href="#" class="btn btn-xs blue">
																<i class="fa fa-file-o"></i> Blue </a>
																<a href="#" class="btn btn-xs green">
																Green <i class="fa fa-font"></i>
																</a>
																<a href="#" class="btn btn-xs yellow">
																Yellow <i class="fa fa-search"></i>
																</a>
																<a href="#" class="btn btn-xs purple">
																<i class="fa fa-times"></i> Purple </a>
																<a href="#" class="btn btn-xs green">
																Green <i class="fa fa-plus"></i>
																</a>
																<a href="#" class="btn btn-xs grey-cascade">
																Dark <i class="fa fa-link"></i>
																</a>
															</div>
															<div class="clearfix">
																<h4 class="block">Font Awesome</h4>
																<a href="#" class="btn default">
																<i class="fa fa-user"></i>
																</a>
																<a href="#" class="btn red">
																<i class="fa fa-edit"></i>
																</a>
																<a href="#" class="btn blue">
																<i class="fa fa-file-o"></i>
																</a>
																<a href="#" class="btn green">
																<i class="fa fa-font"></i>
																</a>
																<a href="#" class="btn yellow">
																<i class="fa fa-search"></i>
																</a>
																<a href="#" class="btn purple">
																<i class="fa fa-times"></i>
																</a>
																<a href="#" class="btn green">
																<i class="fa fa-plus"></i>
																</a>
																<a href="#" class="btn grey-cascade">
																<i class="fa fa-link"></i>
																</a>
															</div>
														</div>
														<div class="tab-pane" id="dropdown_glyphicon">
															<div class="clearfix">
																<h4 class="block">Large Buttons</h4>
																<a href="#" class="btn btn-lg default">
																Default <span class="glyphicon glyphicon-cog">
																</span>
																</a>
																<a href="#" class="btn btn-lg red">
																Red <span class="glyphicon glyphicon-calendar">
																</span>
																</a>
																<a href="#" class="btn btn-lg blue">
																<span class="glyphicon glyphicon-font">
																</span>
																Blue </a>
																<a href="#" class="btn btn-lg green">
																Green <span class="glyphicon glyphicon-gift">
																</span>
																</a>
																<a href="#" class="btn btn-lg yellow">
																Yellow <span class="glyphicon glyphicon-pencil">
																</span>
																</a>
																<a href="#" class="btn btn-lg purple">
																<span class="glyphicon glyphicon-tag">
																</span>
																Purple </a>
																<a href="#" class="btn btn-lg green">
																Green <span class="glyphicon glyphicon-user">
																</span>
																</a>
																<a href="#" class="btn btn-lg grey-cascade">
																Dark <span class="glyphicon glyphicon-link">
																</span>
																</a>
															</div>
															<div class="clearfix">
																<h4 class="block">Default Buttons</h4>
																<a href="#" class="btn default">
																Default <span class="glyphicon glyphicon-cog">
																</span>
																</a>
																<a href="#" class="btn red">
																Red <span class="glyphicon glyphicon-calendar">
																</span>
																</a>
																<a href="#" class="btn blue">
																<span class="glyphicon glyphicon-font">
																</span>
																Blue </a>
																<a href="#" class="btn green">
																Green <span class="glyphicon glyphicon-gift">
																</span>
																</a>
																<a href="#" class="btn yellow">
																Yellow <span class="glyphicon glyphicon-pencil">
																</span>
																</a>
																<a href="#" class="btn purple">
																<span class="glyphicon glyphicon-tag">
																</span>
																Purple </a>
																<a href="#" class="btn green">
																Green <span class="glyphicon glyphicon-user">
																</span>
																</a>
																<a href="#" class="btn grey-cascade">
																Dark <span class="glyphicon glyphicon-link">
																</span>
																</a>
															</div>
															<div class="clearfix">
																<h4 class="block">Small Buttons</h4>
																<a href="#" class="btn btn-sm default">
																Default <span class="glyphicon glyphicon-cog">
																</span>
																</a>
																<a href="#" class="btn btn-sm red">
																Red <span class="glyphicon glyphicon-calendar">
																</span>
																</a>
																<a href="#" class="btn btn-sm blue">
																<span class="glyphicon glyphicon-font">
																</span>
																Blue </a>
																<a href="#" class="btn btn-sm green">
																Green <span class="glyphicon glyphicon-gift">
																</span>
																</a>
																<a href="#" class="btn btn-sm yellow">
																Yellow <span class="glyphicon glyphicon-pencil">
																</span>
																</a>
																<a href="#" class="btn btn-sm purple">
																<span class="glyphicon glyphicon-tag">
																</span>
																Purple </a>
																<a href="#" class="btn btn-sm green">
																Green <span class="glyphicon glyphicon-user">
																</span>
																</a>
																<a href="#" class="btn btn-sm grey-cascade">
																Dark <span class="glyphicon glyphicon-link">
																</span>
																</a>
															</div>
															<div class="clearfix">
																<h4 class="block">Extra Small Buttons</h4>
																<a href="#" class="btn btn-xs default">
																Default <span class="glyphicon glyphicon-cog">
																</span>
																</a>
																<a href="#" class="btn btn-xs red">
																Red <span class="glyphicon glyphicon-calendar">
																</span>
																</a>
																<a href="#" class="btn btn-xs blue">
																<span class="glyphicon glyphicon-font">
																</span>
																Blue </a>
																<a href="#" class="btn btn-xs green">
																Green <span class="glyphicon glyphicon-gift">
																</span>
																</a>
																<a href="#" class="btn btn-xs yellow">
																Yellow <span class="glyphicon glyphicon-pencil">
																</span>
																</a>
																<a href="#" class="btn btn-xs purple">
																<span class="glyphicon glyphicon-tag">
																</span>
																Purple </a>
																<a href="#" class="btn btn-xs green">
																Green <span class="glyphicon glyphicon-user">
																</span>
																</a>
																<a href="#" class="btn btn-xs grey-cascade">
																Dark <span class="glyphicon glyphicon-link">
																</span>
																</a>
															</div>
															<div class="clearfix">
																<h4 class="block">Icon Only Buttons</h4>
																<a href="#" class="btn default">
																<span class="glyphicon glyphicon-cog">
																</span>
																</a>
																<a href="#" class="btn red">
																<span class="glyphicon glyphicon-calendar">
																</span>
																</a>
																<a href="#" class="btn blue">
																<span class="glyphicon glyphicon-font">
																</span>
																</a>
																<a href="#" class="btn green">
																<span class="glyphicon glyphicon-gift">
																</span>
																</a>
																<a href="#" class="btn yellow">
																<span class="glyphicon glyphicon-pencil">
																</span>
																</a>
																<a href="#" class="btn purple">
																<span class="glyphicon glyphicon-tag">
																</span>
																</a>
																<a href="#" class="btn green">
																<span class="glyphicon glyphicon-user">
																</span>
																</a>
																<a href="#" class="btn grey-cascade">
																<span class="glyphicon glyphicon-link">
																</span>
																</a>
															</div>
														</div>
														<div class="tab-pane" id="dropdown_simplelineicons">
															<div class="clearfix">
																<h4 class="block">Large Buttons</h4>
																<a href="#" class="btn btn-lg default">
																Default <span class="icon-social-dribbble">
																</span>
																</a>
																<a href="#" class="btn btn-lg red">
																Red <span class="icon-crop">
																</span>
																</a>
																<a href="#" class="btn btn-lg blue">
																<span class="icon-screen-desktop">
																</span>
																Blue </a>
																<a href="#" class="btn btn-lg green">
																Green <span class="icon-badge">
																</span>
																</a>
																<a href="#" class="btn btn-lg yellow">
																Yellow <span class="icon-anchor">
																</span>
																</a>
																<a href="#" class="btn btn-lg purple">
																<span class="icon-bell">
																</span>
																Purple </a>
																<a href="#" class="btn btn-lg green">
																Green <span class="icon-present">
																</span>
																</a>
																<a href="#" class="btn btn-lg grey-cascade">
																Dark <span class="icon-pin">
																</span>
																</a>
															</div>
															<div class="clearfix">
																<h4 class="block">Default Buttons</h4>
																<a href="#" class="btn default">
																Default <span class="icon-social-dribbble">
																</span>
																</a>
																<a href="#" class="btn red">
																Red <span class="icon-crop">
																</span>
																</a>
																<a href="#" class="btn blue">
																<span class="icon-screen-desktop">
																</span>
																Blue </a>
																<a href="#" class="btn green">
																Green <span class="icon-badge">
																</span>
																</a>
																<a href="#" class="btn yellow">
																Yellow <span class="icon-anchor">
																</span>
																</a>
																<a href="#" class="btn purple">
																<span class="icon-bell">
																</span>
																Purple </a>
																<a href="#" class="btn green">
																Green <span class="icon-present">
																</span>
																</a>
																<a href="#" class="btn grey-cascade">
																Dark <span class="icon-pin">
																</span>
																</a>
															</div>
															<div class="clearfix">
																<h4 class="block">Small Buttons</h4>
																<a href="#" class="btn btn-sm default">
																Default <span class="icon-social-dribbble">
																</span>
																</a>
																<a href="#" class="btn btn-sm red">
																Red <span class="icon-crop">
																</span>
																</a>
																<a href="#" class="btn btn-sm blue">
																<span class="icon-screen-desktop">
																</span>
																Blue </a>
																<a href="#" class="btn btn-sm green">
																Green <span class="icon-badge">
																</span>
																</a>
																<a href="#" class="btn btn-sm yellow">
																Yellow <span class="icon-anchor">
																</span>
																</a>
																<a href="#" class="btn btn-sm purple">
																<span class="icon-bell">
																</span>
																Purple </a>
																<a href="#" class="btn btn-sm green">
																Green <span class="icon-present">
																</span>
																</a>
																<a href="#" class="btn btn-sm grey-cascade">
																Dark <span class="icon-pin">
																</span>
																</a>
															</div>
															<div class="clearfix">
																<h4 class="block">Extra Small Buttons</h4>
																<a href="#" class="btn btn-xs default">
																Default <span class="icon-social-dribbble">
																</span>
																</a>
																<a href="#" class="btn btn-xs red">
																Red <span class="icon-crop">
																</span>
																</a>
																<a href="#" class="btn btn-xs blue">
																<span class="icon-screen-desktop">
																</span>
																Blue </a>
																<a href="#" class="btn btn-xs green">
																Green <span class="icon-badge">
																</span>
																</a>
																<a href="#" class="btn btn-xs yellow">
																Yellow <span class="icon-anchor">
																</span>
																</a>
																<a href="#" class="btn btn-xs purple">
																<span class="icon-bell">
																</span>
																Purple </a>
																<a href="#" class="btn btn-xs green">
																Green <span class="icon-present">
																</span>
																</a>
																<a href="#" class="btn btn-xs grey-cascade">
																Dark <span class="icon-pin">
																</span>
																</a>
															</div>
															<div class="clearfix">
																<h4 class="block">Icon Only Buttons</h4>
																<a href="#" class="btn default">
																<span class="icon-social-dribbble">
																</span>
																</a>
																<a href="#" class="btn red">
																<span class="icon-crop">
																</span>
																</a>
																<a href="#" class="btn blue">
																<span class="icon-screen-desktop">
																</span>
																</a>
																<a href="#" class="btn green">
																<span class="icon-badge">
																</span>
																</a>
																<a href="#" class="btn yellow">
																<span class="icon-anchor">
																</span>
																</a>
																<a href="#" class="btn purple">
																<span class="icon-bell">
																</span>
																</a>
																<a href="#" class="btn green">
																<span class="icon-present">
																</span>
																</a>
																<a href="#" class="btn grey-cascade">
																<span class="icon-pin">
																</span>
																</a>
															</div>
														</div>
														<div class="tab-pane " id="buttons_metro">
															<div class="clearfix">
																<h4 class="block">Navigation Large Icons Buttons</h4>
																<a href="#" class="btn btn-lg default m-icon-big">
																Submit <i class="m-icon-big-swapleft"></i>
																</a>
																<a href="#" class="btn btn-lg green m-icon-big">
																Submit <i class="m-icon-big-swapright m-icon-white"></i>
																</a>
																<a href="#" class="btn btn-lg blue m-icon-big">
																Submit <i class="m-icon-big-swapdown m-icon-white"></i>
																</a>
																<a href="#" class="btn btn-lg dark m-icon-big">
																Submit <i class="m-icon-big-swapup m-icon-white"></i>
																</a>
															</div>
															<div class="clearfix">
																<h4 class="block">Navigation Large Icons Only Buttons</h4>
																<a href="#" class="btn btn-lg default m-icon-big m-icon-only">
																<i class="m-icon-big-swapleft"></i>
																</a>
																<a href="#" class="btn btn-lg green m-icon-big m-icon-only">
																<i class="m-icon-big-swapright m-icon-white"></i>
																</a>
																<a href="#" class="btn btn-lg blue m-icon-big m-icon-only">
																<i class="m-icon-big-swapdown m-icon-white"></i>
																</a>
																<a href="#" class="btn btn-lg dark m-icon-big m-icon-only">
																<i class="m-icon-big-swapup m-icon-white"></i>
																</a>
															</div>
															<div class="clearfix">
																<h4 class="block">Navigation Block Large Icons</h4>
																<button class="btn blue btn-block btn-lg m-icon-big">Button <i class="m-icon-big-swapright m-icon-white"></i></button>
																<a href="#" class="btn green btn-block btn-lg m-icon-big">
																Link <i class="m-icon-big-swapright m-icon-white"></i>
																</a>
															</div>
															<div class="clearfix">
																<h4 class="block">Navigation Defualt Icons Buttons</h4>
																<a href="#" class="btn default m-icon">
																Submit <i class="m-icon-swapleft"></i>
																</a>
																<a href="#" class="btn green m-icon">
																Submit <i class="m-icon-swapright m-icon-white"></i>
																</a>
																<a href="#" class="btn blue m-icon">
																Submit <i class="m-icon-swapdown m-icon-white"></i>
																</a>
																<a href="#" class="btn dark m-icon">
																Submit <i class="m-icon-swapup m-icon-white"></i>
																</a>
															</div>
															<div class="clearfix">
																<h4 class="block">Navigation Defualt Icons Only Buttons</h4>
																<a href="#" class="btn default m-icon m-icon-only">
																<i class="m-icon-swapleft"></i>
																</a>
																<a href="#" class="btn green m-icon m-icon-only">
																<i class="m-icon-swapright m-icon-white"></i>
																</a>
																<a href="#" class="btn blue m-icon m-icon-only">
																<i class="m-icon-swapdown m-icon-white"></i>
																</a>
																<a href="#" class="btn dark m-icon m-icon-only">
																<i class="m-icon-swapup m-icon-white"></i>
																</a>
															</div>
															<div class="clearfix">
																<h4 class="block">Navigation Block Defualt Icons</h4>
																<button class="btn blue btn-block m-icon">Button <i class="m-icon-swapright m-icon-white"></i></button>
																<a href="#" class="btn green btn-block m-icon">
																Link <i class="m-icon-swapright m-icon-white"></i>
																</a>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
										<!-- END BUTTONS WITH ICONS PORTLET-->
										<div class="portlet box blue">
											<div class="portlet-title">
												<div class="caption">
													<i class="fa fa-gift"></i>Font Awesome Styled Buttons
												</div>
												<div class="tools">
													<a href="javascript:;" class="collapse">
													</a>
													<a href="#portlet-config" data-toggle="modal" class="config">
													</a>
													<a href="javascript:;" class="reload">
													</a>
													<a href="javascript:;" class="remove">
													</a>
												</div>
											</div>
											<div class="portlet-body">
												<a href="#" class="icon-btn">
												<i class="fa fa-group"></i>
												<div>
													 Users
												</div>
												<span class="badge badge-danger">
												2 </span>
												</a>
												<a href="#" class="icon-btn">
												<i class="fa fa-barcode"></i>
												<div>
													 Products
												</div>
												<span class="badge badge-success">
												4 </span>
												</a>
												<a href="#" class="icon-btn">
												<i class="fa fa-bar-chart-o"></i>
												<div>
													 Reports
												</div>
												</a>
												<a href="#" class="icon-btn">
												<i class="fa fa-sitemap"></i>
												<div>
													 Categories
												</div>
												</a>
												<a href="#" class="icon-btn">
												<i class="fa fa-calendar"></i>
												<div>
													 Calendar
												</div>
												<span class="badge badge-success">
												4 </span>
												</a>
												<a href="#" class="icon-btn">
												<i class="fa fa-envelope"></i>
												<div>
													 Inbox
												</div>
												<span class="badge badge-info">
												12 </span>
												</a>
												<a href="#" class="icon-btn">
												<i class="fa fa-bullhorn"></i>
												<div>
													 Notification
												</div>
												<span class="badge badge-danger">
												3 </span>
												</a>
												<a href="#" class="icon-btn">
												<i class="fa fa-map-marker"></i>
												<div>
													 Locations
												</div>
												</a>
												<a href="#" class="icon-btn">
												<i class="fa fa-money"><i></i></i>
												<div>
													 Finance
												</div>
												</a>
												<a href="#" class="icon-btn">
												<i class="fa fa-plane"></i>
												<div>
													 Projects
												</div>
												<span class="badge badge-info">
												21 </span>
												</a>
												<a href="#" class="icon-btn">
												<i class="fa fa-thumbs-up"></i>
												<div>
													 Feedback
												</div>
												<span class="badge badge-info">
												2 </span>
												</a>
												<a href="#" class="icon-btn">
												<i class="fa fa-cloud"></i>
												<div>
													 Servers
												</div>
												<span class="badge badge-danger">
												2 </span>
												</a>
												<a href="#" class="icon-btn">
												<i class="fa fa-globe"></i>
												<div>
													 Regions
												</div>
												</a>
												<a href="#" class="icon-btn">
												<i class="fa fa-heart-o"></i>
												<div>
													 Popularity
												</div>
												<span class="badge badge-info">
												221 </span>
												</a>
											</div>
										</div>
										<!-- BEGIN BLOCK BUTTONS PORTLET-->
										<div class="portlet box purple">
											<div class="portlet-title">
												<div class="caption">
													<i class="fa fa-gift"></i>List Social Icons(UL)
												</div>
												<div class="tools">
													<a href="javascript:;" class="collapse">
													</a>
													<a href="#portlet-config" data-toggle="modal" class="config">
													</a>
													<a href="javascript:;" class="reload">
													</a>
													<a href="javascript:;" class="remove">
													</a>
												</div>
											</div>
											<div class="portlet-body util-btn-margin-bottom-5">
												<ul class="social-icons">
													<li>
														<a href="#" data-original-title="amazon" class="amazon">
														</a>
													</li>
													<li>
														<a href="#" data-original-title="behance" class="behance">
														</a>
													</li>
													<li>
														<a href="#" data-original-title="blogger" class="blogger">
														</a>
													</li>
													<li>
														<a href="#" data-original-title="deviantart" class="deviantart">
														</a>
													</li>
													<li>
														<a href="#" data-original-title="dribbble" class="dribbble">
														</a>
													</li>
													<li>
														<a href="#" data-original-title="dropbox" class="dropbox">
														</a>
													</li>
													<li>
														<a href="#" data-original-title="facebook" class="facebook">
														</a>
													</li>
													<li>
														<a href="#" data-original-title="forrst" class="forrst">
														</a>
													</li>
													<li>
														<a href="#" data-original-title="github" class="github">
														</a>
													</li>
													<li>
														<a href="#" data-original-title="Goole Plus" class="googleplus">
														</a>
													</li>
													<li>
														<a href="#" data-original-title="jolicloud" class="jolicloud">
														</a>
													</li>
													<li>
														<a href="#" data-original-title="last-fm" class="last-fm">
														</a>
													</li>
													<li>
														<a href="#" data-original-title="linkedin" class="linkedin">
														</a>
													</li>
													<li>
														<a href="#" data-original-title="picasa" class="picasa">
														</a>
													</li>
													<li>
														<a href="#" data-original-title="pintrest" class="pintrest">
														</a>
													</li>
													<li>
														<a href="#" data-original-title="rss" class="rss">
														</a>
													</li>
													<li>
														<a href="#" data-original-title="skype" class="skype">
														</a>
													</li>
													<li>
														<a href="#" data-original-title="spotify" class="spotify">
														</a>
													</li>
													<li>
														<a href="#" data-original-title="stumbleupon" class="stumbleupon">
														</a>
													</li>
													<li>
														<a href="#" data-original-title="tumblr" class="tumblr">
														</a>
													</li>
													<li>
														<a href="#" data-original-title="twitter" class="twitter">
														</a>
													</li>
													<li>
														<a href="#" data-original-title="vimeo" class="vimeo">
														</a>
													</li>
													<li>
														<a href="#" data-original-title="wordpress" class="wordpress">
														</a>
													</li>
													<li>
														<a href="#" data-original-title="xing" class="xing">
														</a>
													</li>
													<li>
														<a href="#" data-original-title="yahoo" class="yahoo">
														</a>
													</li>
													<li>
														<a href="#" data-original-title="youtube" class="youtube">
														</a>
													</li>
													<li>
														<a href="#" data-original-title="vk" class="vk">
														</a>
													</li>
													<li>
														<a href="#" data-original-title="instagram" class="instagram">
														</a>
													</li>
													<li>
														<a href="#" data-original-title="reddit" class="reddit">
														</a>
													</li>
													<li>
														<a href="#" data-original-title="aboutme" class="aboutme">
														</a>
													</li>
													<li>
														<a href="#" data-original-title="flickr" class="flickr">
														</a>
													</li>
													<li>
														<a href="#" data-original-title="foursquare" class="foursquare">
														</a>
													</li>
													<li>
														<a href="#" data-original-title="gravatar" class="gravatar">
														</a>
													</li>
													<li>
														<a href="#" data-original-title="klout" class="klout">
														</a>
													</li>
													<li>
														<a href="#" data-original-title="myspace" class="myspace">
														</a>
													</li>
													<li>
														<a href="#" data-original-title="quora" class="quora">
														</a>
													</li>
												</ul>
											</div>
										</div>
										<!-- END BLOCK BUTTONS PORTLET-->
										<!-- BEGIN BLOCK BUTTONS PORTLET-->
										<div class="portlet box purple">
											<div class="portlet-title">
												<div class="caption">
													<i class="fa fa-gift"></i>Inline Social Icons
												</div>
												<div class="tools">
													<a href="javascript:;" class="collapse">
													</a>
													<a href="#portlet-config" data-toggle="modal" class="config">
													</a>
													<a href="javascript:;" class="reload">
													</a>
													<a href="javascript:;" class="remove">
													</a>
												</div>
											</div>
											<div class="portlet-body util-btn-margin-bottom-5">
												<a href="#" data-original-title="amazon" class="social-icon amazon">
												</a>
												<a href="#" data-original-title="behance" class="social-icon behance">
												</a>
												<a href="#" data-original-title="blogger" class="social-icon blogger">
												</a>
												<a href="#" data-original-title="deviantart" class="social-icon deviantart">
												</a>
												<a href="#" data-original-title="dribbble" class="social-icon dribbble">
												</a>
												<a href="#" data-original-title="dropbox" class="social-icon dropbox">
												</a>
												<a href="#" data-original-title="facebook" class="social-icon facebook">
												</a>
												<a href="#" data-original-title="forrst" class="social-icon forrst">
												</a>
												<a href="#" data-original-title="github" class="social-icon github">
												</a>
												<a href="#" data-original-title="Goole Plus" class="social-icon googleplus">
												</a>
												<a href="#" data-original-title="jolicloud" class="social-icon jolicloud">
												</a>
												<a href="#" data-original-title="last-fm" class="social-icon last-fm">
												</a>
												<a href="#" data-original-title="linkedin" class="social-icon linkedin">
												</a>
												<a href="#" data-original-title="picasa" class="social-icon picasa">
												</a>
												<a href="#" data-original-title="pintrest" class="social-icon pintrest">
												</a>
												<a href="#" data-original-title="rss" class="social-icon rss">
												</a>
												<a href="#" data-original-title="skype" class="social-icon skype">
												</a>
												<a href="#" data-original-title="spotify" class="social-icon spotify">
												</a>
												<a href="#" data-original-title="stumbleupon" class="social-icon stumbleupon">
												</a>
												<a href="#" data-original-title="tumblr" class="social-icon tumblr">
												</a>
												<a href="#" data-original-title="twitter" class="social-icon twitter">
												</a>
												<a href="#" data-original-title="vimeo" class="social-icon vimeo">
												</a>
												<a href="#" data-original-title="wordpress" class="social-icon wordpress">
												</a>
												<a href="#" data-original-title="xing" class="social-icon xing">
												</a>
												<a href="#" data-original-title="yahoo" class="social-icon yahoo">
												</a>
												<a href="#" data-original-title="youtube" class="social-icon youtube">
												</a>
												<a href="#" data-original-title="vk" class="social-icon vk">
												</a>
												<a href="#" data-original-title="instagram" class="social-icon instagram">
												</a>
												<a href="#" data-original-title="reddit" class="social-icon reddit">
												</a>
												<a href="#" data-original-title="aboutme" class="social-icon aboutme">
												</a>
												<a href="#" data-original-title="flickr" class="social-icon flickr">
												</a>
												<a href="#" data-original-title="foursquare" class="social-icon foursquare">
												</a>
												<a href="#" data-original-title="gravatar" class="social-icon gravatar">
												</a>
												<a href="#" data-original-title="klout" class="social-icon klout">
												</a>
												<a href="#" data-original-title="myspace" class="social-icon myspace">
												</a>
												<a href="#" data-original-title="quora" class="social-icon quora">
												</a>
											</div>
										</div>
										<!-- END BLOCK BUTTONS PORTLET-->
										<!-- BEGIN BLOCK BUTTONS PORTLET-->
										<div class="portlet box blue">
											<div class="portlet-title">
												<div class="caption">
													<i class="fa fa-gift"></i>Social Icons(Colored)
												</div>
												<div class="tools">
													<a href="javascript:;" class="collapse">
													</a>
													<a href="#portlet-config" data-toggle="modal" class="config">
													</a>
													<a href="javascript:;" class="reload">
													</a>
													<a href="javascript:;" class="remove">
													</a>
												</div>
											</div>
											<div class="portlet-body">
												<ul class="social-icons social-icons-color">
													<li>
														<a href="#" data-original-title="amazon" class="amazon">
														</a>
													</li>
													<li>
														<a href="#" data-original-title="behance" class="behance">
														</a>
													</li>
													<li>
														<a href="#" data-original-title="blogger" class="blogger">
														</a>
													</li>
													<li>
														<a href="#" data-original-title="deviantart" class="deviantart">
														</a>
													</li>
													<li>
														<a href="#" data-original-title="dribbble" class="dribbble">
														</a>
													</li>
													<li>
														<a href="#" data-original-title="dropbox" class="dropbox">
														</a>
													</li>
													<li>
														<a href="#" data-original-title="facebook" class="facebook">
														</a>
													</li>
													<li>
														<a href="#" data-original-title="forrst" class="forrst">
														</a>
													</li>
													<li>
														<a href="#" data-original-title="github" class="github">
														</a>
													</li>
													<li>
														<a href="#" data-original-title="Goole Plus" class="googleplus">
														</a>
													</li>
													<li>
														<a href="#" data-original-title="jolicloud" class="jolicloud">
														</a>
													</li>
													<li>
														<a href="#" data-original-title="last-fm" class="last-fm">
														</a>
													</li>
													<li>
														<a href="#" data-original-title="linkedin" class="linkedin">
														</a>
													</li>
													<li>
														<a href="#" data-original-title="picasa" class="picasa">
														</a>
													</li>
													<li>
														<a href="#" data-original-title="pintrest" class="pintrest">
														</a>
													</li>
													<li>
														<a href="#" data-original-title="rss" class="rss">
														</a>
													</li>
													<li>
														<a href="#" data-original-title="skype" class="skype">
														</a>
													</li>
													<li>
														<a href="#" data-original-title="spotify" class="spotify">
														</a>
													</li>
													<li>
														<a href="#" data-original-title="stumbleupon" class="stumbleupon">
														</a>
													</li>
													<li>
														<a href="#" data-original-title="tumblr" class="tumblr">
														</a>
													</li>
													<li>
														<a href="#" data-original-title="twitter" class="twitter">
														</a>
													</li>
													<li>
														<a href="#" data-original-title="vimeo" class="vimeo">
														</a>
													</li>
													<li>
														<a href="#" data-original-title="wordpress" class="wordpress">
														</a>
													</li>
													<li>
														<a href="#" data-original-title="xing" class="xing">
														</a>
													</li>
													<li>
														<a href="#" data-original-title="yahoo" class="yahoo">
														</a>
													</li>
													<li>
														<a href="#" data-original-title="youtube" class="youtube">
														</a>
													</li>
													<li>
														<a href="#" data-original-title="vk" class="vk">
														</a>
													</li>
													<li>
														<a href="#" data-original-title="instagram" class="instagram">
														</a>
													</li>
													<li>
														<a href="#" data-original-title="reddit" class="reddit">
														</a>
													</li>
													<li>
														<a href="#" data-original-title="aboutme" class="aboutme">
														</a>
													</li>
													<li>
														<a href="#" data-original-title="flickr" class="flickr">
														</a>
													</li>
													<li>
														<a href="#" data-original-title="foursquare" class="foursquare">
														</a>
													</li>
													<li>
														<a href="#" data-original-title="gravatar" class="gravatar">
														</a>
													</li>
													<li>
														<a href="#" data-original-title="klout" class="klout">
														</a>
													</li>
													<li>
														<a href="#" data-original-title="myspace" class="myspace">
														</a>
													</li>
													<li>
														<a href="#" data-original-title="quora" class="quora">
														</a>
													</li>
												</ul>
											</div>
										</div>
										<!-- END BLOCK BUTTONS PORTLET-->
										<!-- BEGIN BLOCK BUTTONS PORTLET-->
										<div class="portlet box purple">
											<div class="portlet-title">
												<div class="caption">
													<i class="fa fa-gift"></i>Inline Social Icons(Colored)
												</div>
												<div class="tools">
													<a href="javascript:;" class="collapse">
													</a>
													<a href="#portlet-config" data-toggle="modal" class="config">
													</a>
													<a href="javascript:;" class="reload">
													</a>
													<a href="javascript:;" class="remove">
													</a>
												</div>
											</div>
											<div class="portlet-body util-btn-margin-bottom-5">
												<a href="#" data-original-title="amazon" class="social-icon social-icon-color amazon">
												</a>
												<a href="#" data-original-title="behance" class="social-icon social-icon-color behance">
												</a>
												<a href="#" data-original-title="blogger" class="social-icon social-icon-color blogger">
												</a>
												<a href="#" data-original-title="deviantart" class="social-icon social-icon-color deviantart">
												</a>
												<a href="#" data-original-title="dribbble" class="social-icon social-icon-color dribbble">
												</a>
												<a href="#" data-original-title="dropbox" class="social-icon social-icon-color dropbox">
												</a>
												<a href="#" data-original-title="facebook" class="social-icon social-icon-color facebook">
												</a>
												<a href="#" data-original-title="forrst" class="social-icon social-icon-color forrst">
												</a>
												<a href="#" data-original-title="github" class="social-icon social-icon-color github">
												</a>
												<a href="#" data-original-title="Goole Plus" class="social-icon social-icon-color googleplus">
												</a>
												<a href="#" data-original-title="jolicloud" class="social-icon social-icon-color jolicloud">
												</a>
												<a href="#" data-original-title="last-fm" class="social-icon social-icon-color last-fm">
												</a>
												<a href="#" data-original-title="linkedin" class="social-icon social-icon-color linkedin">
												</a>
												<a href="#" data-original-title="picasa" class="social-icon social-icon-color picasa">
												</a>
												<a href="#" data-original-title="pintrest" class="social-icon social-icon-color pintrest">
												</a>
												<a href="#" data-original-title="rss" class="social-icon social-icon-color rss">
												</a>
												<a href="#" data-original-title="skype" class="social-icon social-icon-color skype">
												</a>
												<a href="#" data-original-title="spotify" class="social-icon social-icon-color spotify">
												</a>
												<a href="#" data-original-title="stumbleupon" class="social-icon social-icon-color stumbleupon">
												</a>
												<a href="#" data-original-title="tumblr" class="social-icon social-icon-color tumblr">
												</a>
												<a href="#" data-original-title="twitter" class="social-icon social-icon-color twitter">
												</a>
												<a href="#" data-original-title="vimeo" class="social-icon social-icon-color vimeo">
												</a>
												<a href="#" data-original-title="wordpress" class="social-icon social-icon-color wordpress">
												</a>
												<a href="#" data-original-title="xing" class="social-icon social-icon-color xing">
												</a>
												<a href="#" data-original-title="yahoo" class="social-icon social-icon-color yahoo">
												</a>
												<a href="#" data-original-title="youtube" class="social-icon social-icon-color youtube">
												</a>
												<a href="#" data-original-title="vk" class="social-icon social-icon-color vk">
												</a>
												<a href="#" data-original-title="instagram" class="social-icon social-icon-color instagram">
												</a>
												<a href="#" data-original-title="reddit" class="social-icon social-icon-color reddit">
												</a>
												<a href="#" data-original-title="aboutme" class="social-icon social-icon-color aboutme">
												</a>
												<a href="#" data-original-title="flickr" class="social-icon social-icon-color flickr">
												</a>
												<a href="#" data-original-title="foursquare" class="social-icon social-icon-color foursquare">
												</a>
												<a href="#" data-original-title="gravatar" class="social-icon social-icon-color gravatar">
												</a>
												<a href="#" data-original-title="klout" class="social-icon social-icon-color klout">
												</a>
												<a href="#" data-original-title="myspace" class="social-icon social-icon-color myspace">
												</a>
												<a href="#" data-original-title="quora" class="social-icon social-icon-color quora">
												</a>
											</div>
										</div>
										<!-- END BLOCK BUTTONS PORTLET-->
									</div>
									<div class="col-md-6">
										<!-- BEGIN BLOCK BUTTONS PORTLET-->
										<div class="portlet box yellow">
											<div class="portlet-title">
												<div class="caption">
													<i class="fa fa-gift"></i>Button Groups
												</div>
												<div class="tools">
													<a href="javascript:;" class="collapse">
													</a>
													<a href="#portlet-config" data-toggle="modal" class="config">
													</a>
													<a href="javascript:;" class="reload">
													</a>
													<a href="javascript:;" class="remove">
													</a>
												</div>
											</div>
											<div class="portlet-body">
												<div class="clearfix">
													<h4 class="block">Basic Example</h4>
													<div class="btn-group">
														<button type="button" class="btn btn-default">Left</button>
														<button type="button" class="btn btn-default">Middle</button>
														<button type="button" class="btn btn-default">Right</button>
													</div>
													<div class="btn-group btn-group-solid">
														<button type="button" class="btn red">Left</button>
														<button type="button" class="btn yellow">Middle</button>
														<button type="button" class="btn green">Right</button>
													</div>
												</div>
												<div class="clearfix">
													<h4 class="block">Button Toolbar</h4>
													<div class="btn-toolbar margin-bottom-10">
														<div class="btn-group">
															<button type="button" class="btn btn-default">1</button>
															<button type="button" class="btn btn-default">2</button>
															<button type="button" class="btn btn-default">3</button>
															<button type="button" class="btn btn-default">4</button>
														</div>
														<div class="btn-group">
															<button type="button" class="btn btn-default">5</button>
															<button type="button" class="btn btn-default">6</button>
															<button type="button" class="btn btn-default">7</button>
														</div>
														<div class="btn-group">
															<button type="button" class="btn btn-default">8</button>
														</div>
													</div>
													<div class="btn-toolbar">
														<div class="btn-group btn-group-solid">
															<button type="button" class="btn red">1</button>
															<button type="button" class="btn green">2</button>
															<button type="button" class="btn blue">3</button>
															<button type="button" class="btn yellow">4</button>
														</div>
														<div class="btn-group btn-group-solid">
															<button type="button" class="btn purple">5</button>
															<button type="button" class="btn dark">6</button>
															<button type="button" class="btn default">7</button>
														</div>
														<div class="btn-group btn-group-solid">
															<button type="button" class="btn red">8</button>
														</div>
													</div>
												</div>
												<div class="clearfix">
													<h4 class="block">Button Group Sizing</h4>
													<div class="btn-toolbar">
														<div class="btn-group btn-group-lg btn-group-solid margin-bottom-10">
															<button type="button" class="btn red">Left</button>
															<button type="button" class="btn green">Middle</button>
															<button type="button" class="btn blue">Right</button>
														</div>
													</div>
													<div class="btn-toolbar margin-bottom-10">
														<div class="btn-group btn-group-solid">
															<button type="button" class="btn red">Left</button>
															<button type="button" class="btn green">Middle</button>
															<button type="button" class="btn blue">Right</button>
														</div>
													</div>
													<div class="btn-toolbar margin-bottom-10">
														<div class="btn-group btn-group-sm btn-group-solid">
															<button type="button" class="btn red">Left</button>
															<button type="button" class="btn green">Middle</button>
															<button type="button" class="btn blue">Right</button>
														</div>
													</div>
													<div class="btn-toolbar margin-bottom-10">
														<div class="btn-group btn-group-xs btn-group-solid">
															<button type="button" class="btn red">Left</button>
															<button type="button" class="btn green">Middle</button>
															<button type="button" class="btn blue">Right</button>
														</div>
													</div>
												</div>
												<div class="clearfix">
													<h4 class="block">Nesting Button Group</h4>
													<div class="btn-group">
														<button type="button" class="btn btn-default"><i class="fa fa-user"></i> Profile</button>
														<button type="button" class="btn btn-default"><i class="fa fa-cogs"></i> Settings</button>
														<button type="button" class="btn btn-default"><i class="fa fa-bullhorn"></i> Feeds</button>
														<div class="btn-group">
															<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
															<i class="fa fa-ellipsis-horizontal"></i> More <i class="fa fa-angle-down"></i>
															</button>
															<ul class="dropdown-menu">
																<li>
																	<a href="#">
																	Dropdown link </a>
																</li>
																<li>
																	<a href="#">
																	Dropdown link </a>
																</li>
															</ul>
														</div>
													</div>
													<div class="clearfix margin-bottom-10">
													</div>
													<div class="btn-group btn-group-solid">
														<button type="button" class="btn red"><i class="fa fa-user"></i> Profile</button>
														<button type="button" class="btn green"><i class="fa fa-cogs"></i> Settings</button>
														<button type="button" class="btn purple"><i class="fa fa-bullhorn"></i> Feeds</button>
														<div class="btn-group btn-group-solid">
															<button type="button" class="btn blue dropdown-toggle" data-toggle="dropdown">
															<i class="fa fa-ellipsis-horizontal"></i> More <i class="fa fa-angle-down"></i>
															</button>
															<ul class="dropdown-menu">
																<li>
																	<a href="#">
																	Dropdown link </a>
																</li>
																<li>
																	<a href="#">
																	Dropdown link </a>
																</li>
															</ul>
														</div>
													</div>
												</div>
												<div class="clearfix">
													<h4 class="block">Vertical variation</h4>
													<div class="btn-group-vertical margin-right-10">
														<button type="button" class="btn btn-default">Button</button>
														<button type="button" class="btn btn-default">Button</button>
														<div class="btn-group">
															<button id="btnGroupVerticalDrop1" type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
															Dropdown <i class="fa fa-angle-down"></i>
															</button>
															<ul class="dropdown-menu" role="menu" aria-labelledby="btnGroupVerticalDrop1">
																<li>
																	<a href="#">
																	Dropdown link </a>
																</li>
																<li>
																	<a href="#">
																	Dropdown link </a>
																</li>
															</ul>
														</div>
														<button type="button" class="btn btn-default">Button</button>
														<button type="button" class="btn btn-default">Button</button>
														<div class="btn-group">
															<button id="btnGroupVerticalDrop2" type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
															Dropdown <i class="fa fa-angle-down"></i>
															</button>
															<ul class="dropdown-menu" role="menu" aria-labelledby="btnGroupVerticalDrop2">
																<li>
																	<a href="#">
																	Dropdown link </a>
																</li>
																<li>
																	<a href="#">
																	Dropdown link </a>
																</li>
															</ul>
														</div>
														<div class="btn-group">
															<button id="btnGroupVerticalDrop3" type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
															Dropdown <i class="fa fa-angle-down"></i>
															</button>
															<ul class="dropdown-menu" role="menu" aria-labelledby="btnGroupVerticalDrop3">
																<li>
																	<a href="#">
																	Dropdown link </a>
																</li>
																<li>
																	<a href="#">
																	Dropdown link </a>
																</li>
															</ul>
														</div>
														<div class="btn-group">
															<button id="btnGroupVerticalDrop4" type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
															Dropdown <i class="fa fa-angle-down"></i>
															</button>
															<ul class="dropdown-menu" role="menu" aria-labelledby="btnGroupVerticalDrop4">
																<li>
																	<a href="#">
																	Dropdown link </a>
																</li>
																<li>
																	<a href="#">
																	Dropdown link </a>
																</li>
															</ul>
														</div>
													</div>
													<div class="btn-group-vertical btn-group-solid">
														<button type="button" class="btn blue">Button</button>
														<button type="button" class="btn green">Button</button>
														<div class="btn-group">
															<button id="btnGroupVerticalDrop5" type="button" class="btn yellow dropdown-toggle" data-toggle="dropdown">
															Dropdown <i class="fa fa-angle-down"></i>
															</button>
															<ul class="dropdown-menu" role="menu" aria-labelledby="btnGroupVerticalDrop5">
																<li>
																	<a href="#">
																	Dropdown link </a>
																</li>
																<li>
																	<a href="#">
																	Dropdown link </a>
																</li>
															</ul>
														</div>
														<button type="button" class="btn red">Button</button>
														<button type="button" class="btn dark">Button</button>
														<div class="btn-group">
															<button id="btnGroupVerticalDrop6" type="button" class="btn default dropdown-toggle" data-toggle="dropdown">
															Dropdown <i class="fa fa-angle-down"></i>
															</button>
															<ul class="dropdown-menu" role="menu" aria-labelledby="btnGroupVerticalDrop6">
																<li>
																	<a href="#">
																	Dropdown link </a>
																</li>
																<li>
																	<a href="#">
																	Dropdown link </a>
																</li>
															</ul>
														</div>
														<div class="btn-group">
															<button id="btnGroupVerticalDrop7" type="button" class="btn purple dropdown-toggle" data-toggle="dropdown">
															Dropdown <i class="fa fa-angle-down"></i>
															</button>
															<ul class="dropdown-menu" role="menu" aria-labelledby="btnGroupVerticalDrop7">
																<li>
																	<a href="#">
																	Dropdown link </a>
																</li>
																<li>
																	<a href="#">
																	Dropdown link </a>
																</li>
															</ul>
														</div>
														<div class="btn-group">
															<button id="btnGroupVerticalDrop8" type="button" class="btn yellow dropdown-toggle" data-toggle="dropdown">
															Dropdown <i class="fa fa-angle-down"></i>
															</button>
															<ul class="dropdown-menu" role="menu" aria-labelledby="btnGroupVerticalDrop8">
																<li>
																	<a href="#">
																	Dropdown link </a>
																</li>
																<li>
																	<a href="#">
																	Dropdown link </a>
																</li>
															</ul>
														</div>
													</div>
												</div>
												<div class="clearfix">
													<h4 class="block">Justified Link Variation</h4>
													<div class="btn-group btn-group-justified">
														<a href="#" class="btn btn-default">
														Left </a>
														<a href="#" class="btn btn-default">
														Middle </a>
														<a href="#" class="btn btn-default">
														Right </a>
													</div>
													<div class="clearfix margin-bottom-10">
													</div>
													<div class="btn-group btn-group btn-group-justified">
														<a href="#" class="btn red">
														Left </a>
														<a href="#" class="btn blue">
														Middle </a>
														<a href="#" class="btn green">
														Right </a>
													</div>
												</div>
											</div>
										</div>
										<!-- END BLOCK BUTTONS PORTLET-->
										<!-- BEGIN DROPDOWNS PORTLET-->
										<div class="portlet box blue tabbable hide">
											<div class="portlet-title">
												<div class="caption">
													<i class="fa fa-gift"></i>
													<span class="hidden-480">
													Dropdowns </span>
												</div>
											</div>
											<div class="portlet-body form">
												<div class="portlet-tabs">
													<ul class="nav nav-tabs">
														<li>
															<a href="#dropdown_2" data-toggle="tab">
															Hoverable </a>
														</li>
														<li class="active">
															<a href="#dropdown_1" data-toggle="tab">
															Default </a>
														</li>
													</ul>
													<div class="tab-content">
														<div class="tab-pane active" id="dropdown_1">
															<h4 class="block">Dropdown buttons</h4>
															<div class="btn-group">
																<a class="btn dropdown-toggle" data-toggle="dropdown" href="#">
																Tools <i class="fa fa-angle-down"></i>
																</a>
																<ul class="dropdown-menu">
																	<li>
																		<a href="#">
																		Settings <span class="badge badge-success">
																		3 </span>
																		</a>
																	</li>
																	<li>
																		<a href="#">
																		Preferences </a>
																	</li>
																	<li>
																		<a href="#">
																		Window Options </a>
																	</li>
																	<li>
																		<a href="#">
																		Help <span class="badge badge-danger">
																		7 </span>
																		</a>
																	</li>
																</ul>
															</div>
															<div class="btn-group">
																<button class="btn red dropdown-toggle" data-toggle="dropdown">Primary <i class="fa fa-angle-down"></i></button>
																<ul class="dropdown-menu">
																	<li>
																		<a href="#">
																		Action </a>
																	</li>
																	<li>
																		<a href="#">
																		Another action <span class="badge badge-warning">
																		2 </span>
																		</a>
																	</li>
																	<li>
																		<a href="#">
																		Something else here </a>
																	</li>
																	<li class="divider">
																	</li>
																	<li>
																		<a href="#">
																		Separated link <span class="badge badge-info">
																		7 </span>
																		</a>
																	</li>
																</ul>
															</div>
															<div class="btn-group">
																<button class="btn purple dropdown-toggle" data-toggle="dropdown">Success <i class="fa fa-angle-down"></i>
																</button>
																<ul class="dropdown-menu">
																	<li>
																		<a href="#">
																		Action <span class="badge badge-inverse">
																		7 </span>
																		</a>
																	</li>
																	<li>
																		<a href="#">
																		Another action </a>
																	</li>
																	<li>
																		<a href="#">
																		Something else here </a>
																	</li>
																	<li class="divider">
																	</li>
																	<li>
																		<a href="#">
																		Separated link <span class="badge">
																		4 </span>
																		</a>
																	</li>
																</ul>
															</div>
															<div class="btn-toolbar hide">
																<div class="btn-group">
																	<button class="btn green dropdown-toggle" data-toggle="dropdown">Success <i class="fa fa-angle-down"></i>
																	</button>
																	<ul class="dropdown-menu">
																		<li>
																			<a href="#">
																			Action </a>
																		</li>
																		<li>
																			<a href="#">
																			Another action </a>
																		</li>
																		<li>
																			<a href="#">
																			Something else here </a>
																		</li>
																		<li class="divider">
																		</li>
																		<li>
																			<a href="#">
																			Separated link </a>
																		</li>
																	</ul>
																</div>
																<!-- /btn-group -->
																<div class="btn-group">
																	<button class="btn blue dropdown-toggle" data-toggle="dropdown">Info <i class="fa fa-angle-down"></i>
																	</button>
																	<ul class="dropdown-menu">
																		<li>
																			<a href="#">
																			Action </a>
																		</li>
																		<li>
																			<a href="#">
																			Another action </a>
																		</li>
																		<li>
																			<a href="#">
																			Something else here </a>
																		</li>
																		<li class="divider">
																		</li>
																		<li>
																			<a href="#">
																			Separated link </a>
																		</li>
																	</ul>
																</div>
																<!-- /btn-group -->
																<div class="btn-group">
																	<button class="btn black dropdown-toggle" data-toggle="dropdown">Inverse <i class="fa fa-angle-down"></i>
																	</button>
																	<ul class="dropdown-menu opens-left">
																		<li>
																			<a href="#">
																			Action </a>
																		</li>
																		<li>
																			<a href="#">
																			Another action </a>
																		</li>
																		<li>
																			<a href="#">
																			Something else here </a>
																		</li>
																		<li class="divider">
																		</li>
																		<li>
																			<a href="#">
																			Separated link </a>
																		</li>
																	</ul>
																</div>
																<!-- /btn-group -->
															</div>
															<h4 class="block">Dropdown button with icons</h4>
															<div class="btn-toolbar">
																<div class="btn-group">
																	<a class="btn green" href="#" data-toggle="dropdown">
																	<i class="fa fa-user"></i> User <i class="fa fa-angle-down"></i>
																	</a>
																	<ul class="dropdown-menu">
																		<li>
																			<a href="#">
																			<i class="fa fa-pencil"></i> Edit </a>
																		</li>
																		<li>
																			<a href="#">
																			<i class="fa fa-trash-o"></i> Delete </a>
																		</li>
																		<li>
																			<a href="#">
																			<i class="fa fa-ban"></i> Ban </a>
																		</li>
																		<li class="divider">
																		</li>
																		<li>
																			<a href="#">
																			<i class="i"></i> Make admin </a>
																		</li>
																	</ul>
																</div>
																<div class="btn-group">
																	<a class="btn purple" href="#" data-toggle="dropdown">
																	<i class="fa fa-user"></i> Settings <i class="fa fa-angle-down"></i>
																	</a>
																	<ul class="dropdown-menu">
																		<li>
																			<a href="#">
																			<i class="fa fa-plus"></i> Add </a>
																		</li>
																		<li>
																			<a href="#">
																			<i class="fa fa-trash-o"></i> Edit </a>
																		</li>
																		<li>
																			<a href="#">
																			<i class="fa fa-times"></i> Delete </a>
																		</li>
																		<li class="divider">
																		</li>
																		<li>
																			<a href="#">
																			<i class="i"></i> Full Settings </a>
																		</li>
																	</ul>
																</div>
															</div>
															<div class="well">
															</div>
															<div class="well">
																<h4 class="block">Dropup menu options.</h4>
																<div class="btn-group">
																	<button class="btn blue dropdown-toggle" data-toggle="dropdown">Info <i class="fa fa-angle-down"></i>
																	</button>
																	<ul class="dropdown-menu bottom-up">
																		<li>
																			<a href="#">
																			Action </a>
																		</li>
																		<li>
																			<a href="#">
																			Another action </a>
																		</li>
																		<li>
																			<a href="#">
																			Something else here </a>
																		</li>
																		<li class="divider">
																		</li>
																		<li>
																			<a href="#">
																			Separated link </a>
																		</li>
																	</ul>
																</div>
																<div class="btn-group">
																	<button class="btn black dropdown-toggle" data-toggle="dropdown">Inverse <i class="fa fa-angle-down"></i>
																	</button>
																	<ul class="dropdown-menu bottom-up">
																		<li>
																			<a href="#">
																			Action </a>
																		</li>
																		<li>
																			<a href="#">
																			Another action </a>
																		</li>
																		<li>
																			<a href="#">
																			Something else here </a>
																		</li>
																		<li class="divider">
																		</li>
																		<li>
																			<a href="#">
																			Separated link </a>
																		</li>
																	</ul>
																</div>
																<p>
																	<span class="label label-success">
																	NOTE: </span>
																	&nbsp; By adding <code>bottom-up</code> class you make dropup menu.
																</p>
															</div>
														</div>
														<div class="tab-pane" id="dropdown_2">
															<h4 class="block">Hoverable Dropdown Buttons</h4>
															<div class="btn-group">
																<a class="btn dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-delay="1000" data-close-others="true" href="#">
																Tools <i class="fa fa-angle-down"></i>
																</a>
																<ul class="dropdown-menu">
																	<li>
																		<a href="#">
																		Settings <span class="badge badge-success">
																		3 </span>
																		</a>
																	</li>
																	<li>
																		<a href="#">
																		Preferences </a>
																	</li>
																	<li>
																		<a href="#">
																		Window Options </a>
																	</li>
																	<li>
																		<a href="#">
																		Help <span class="badge badge-danger">
																		7 </span>
																		</a>
																	</li>
																</ul>
															</div>
															<div class="btn-group">
																<button class="btn red dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-delay="1000" data-close-others="true">Primary <i class="fa fa-angle-down"></i></button>
																<ul class="dropdown-menu">
																	<li>
																		<a href="#">
																		Action <span class="badge badge-warning">
																		7 </span>
																		</a>
																	</li>
																	<li>
																		<a href="#">
																		Another action <span class="badge badge-danger">
																		2 </span>
																		</a>
																	</li>
																	<li>
																		<a href="#">
																		Something else here </a>
																	</li>
																	<li class="divider">
																	</li>
																	<li>
																		<a href="#">
																		Separated link <span class="badge badge-info">
																		4 </span>
																		</a>
																	</li>
																</ul>
															</div>
															<div class="btn-group">
																<button class="btn purple dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-delay="1000" data-close-others="true">Success <i class="fa fa-angle-down"></i>
																</button>
																<ul class="dropdown-menu">
																	<li>
																		<a href="#">
																		Action <span class="badge badge-inverse">
																		7 </span>
																		</a>
																	</li>
																	<li>
																		<a href="#">
																		Another action </a>
																	</li>
																	<li>
																		<a href="#">
																		Something else here </a>
																	</li>
																	<li class="divider">
																	</li>
																	<li>
																		<a href="#">
																		Separated link <span class="badge">
																		4 </span>
																		</a>
																	</li>
																</ul>
															</div>
															<div class="btn-toolbar hide">
																<div class="btn-group">
																	<button class="btn green dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-delay="1000" data-close-others="true">Success <i class="fa fa-angle-down"></i>
																	</button>
																	<ul class="dropdown-menu">
																		<li>
																			<a href="#">
																			Action </a>
																		</li>
																		<li>
																			<a href="#">
																			Another action </a>
																		</li>
																		<li>
																			<a href="#">
																			Something else here </a>
																		</li>
																		<li class="divider">
																		</li>
																		<li>
																			<a href="#">
																			Separated link </a>
																		</li>
																	</ul>
																</div>
																<!-- /btn-group -->
																<div class="btn-group">
																	<button class="btn blue dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-delay="1000" data-close-others="true">Info <i class="fa fa-angle-down"></i>
																	</button>
																	<ul class="dropdown-menu">
																		<li>
																			<a href="#">
																			Action </a>
																		</li>
																		<li>
																			<a href="#">
																			Another action </a>
																		</li>
																		<li>
																			<a href="#">
																			Something else here </a>
																		</li>
																		<li class="divider">
																		</li>
																		<li>
																			<a href="#">
																			Separated link </a>
																		</li>
																	</ul>
																</div>
																<!-- /btn-group -->
																<div class="btn-group">
																	<button class="btn black dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-delay="1000" data-close-others="true">Inverse <i class="fa fa-angle-down"></i>
																	</button>
																	<ul class="dropdown-menu opens-left">
																		<li>
																			<a href="#">
																			Action </a>
																		</li>
																		<li>
																			<a href="#">
																			Another action </a>
																		</li>
																		<li>
																			<a href="#">
																			Something else here </a>
																		</li>
																		<li class="divider">
																		</li>
																		<li>
																			<a href="#">
																			Separated link </a>
																		</li>
																	</ul>
																</div>
																<!-- /btn-group -->
															</div>
															<h4 class="block">Hoverable Dropdown Buttons with Icons</h4>
															<div class="btn-toolbar">
																<div class="btn-group">
																	<a class="btn green" href="#" data-toggle="dropdown" data-hover="dropdown" data-delay="1000" data-close-others="true">
																	<i class="fa fa-user"></i> User <i class="fa fa-angle-down"></i>
																	</a>
																	<ul class="dropdown-menu">
																		<li>
																			<a href="#">
																			<i class="fa fa-pencil"></i> Edit </a>
																		</li>
																		<li>
																			<a href="#">
																			<i class="fa fa-trash-o"></i> Delete </a>
																		</li>
																		<li>
																			<a href="#">
																			<i class="fa fa-ban"></i> Ban </a>
																		</li>
																		<li class="divider">
																		</li>
																		<li>
																			<a href="#">
																			<i class="i"></i> Make admin </a>
																		</li>
																	</ul>
																</div>
																<div class="btn-group">
																	<a class="btn purple" href="#" data-toggle="dropdown" data-hover="dropdown" data-delay="1000" data-close-others="true">
																	<i class="fa fa-user"></i> Settings <i class="fa fa-angle-down"></i>
																	</a>
																	<ul class="dropdown-menu">
																		<li>
																			<a href="#">
																			<i class="fa fa-plus"></i> Add </a>
																		</li>
																		<li>
																			<a href="#">
																			<i class="fa fa-trash-o"></i> Edit </a>
																		</li>
																		<li>
																			<a href="#">
																			<i class="fa fa-times"></i> Delete </a>
																		</li>
																		<li class="divider">
																		</li>
																		<li>
																			<a href="#">
																			<i class="i"></i> Full Settings </a>
																		</li>
																	</ul>
																</div>
															</div>
															<div class="well">
																<h4 class="block">Hoverable Dropdown Buttons Dropdown with Checkboxes.</h4>
																<div class="btn-group">
																	<a class="btn green" href="#" data-toggle="dropdown" data-hover="dropdown" data-delay="1000" data-close-others="true">
																	Options #1 <i class="fa fa-angle-down"></i>
																	</a>
																	<div class="dropdown-menu hold-on-click dropdown-checkboxes">
																		<label><input type="checkbox">Option 1</label>
																		<label><input type="checkbox">Option 2</label>
																		<label><input type="checkbox">Option 3</label>
																		<label><input type="checkbox">Option 4</label>
																		<label><input type="checkbox">Option 5</label>
																	</div>
																</div>
																<div class="btn-group">
																	<a class="btn red" href="#" data-toggle="dropdown" data-hover="dropdown" data-delay="1000" data-close-others="true">
																	Options #2 <i class="fa fa-angle-down"></i>
																	</a>
																	<div class="dropdown-menu hold-on-click dropdown-checkboxes">
																		<label><input type="checkbox">Option 1</label>
																		<label><input type="checkbox" checked>Option 2</label>
																		<label><input type="checkbox">Option 3</label>
																		<label><input type="checkbox" checked>Option 4</label>
																		<label><input type="checkbox">Option 5</label>
																	</div>
																</div>
																<p>
																	<span class="label label-success">
																	NOTE: </span>
																	&nbsp; By adding <code>hold-on-click</code> class you can avoid closing the dropdown on click
																</p>
															</div>
															<div class="well">
																<h4 class="block">Hoverable Dropup Buttons.</h4>
																<div class="btn-group">
																	<button class="btn blue dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-delay="1000" data-close-others="true">Info <i class="fa fa-angle-down"></i>
																	</button>
																	<ul class="dropdown-menu bottom-up">
																		<li>
																			<a href="#">
																			Action </a>
																		</li>
																		<li>
																			<a href="#">
																			Another action </a>
																		</li>
																		<li>
																			<a href="#">
																			Something else here </a>
																		</li>
																		<li class="divider">
																		</li>
																		<li>
																			<a href="#">
																			Separated link </a>
																		</li>
																	</ul>
																</div>
																<!-- /btn-group -->
																<div class="btn-group">
																	<button class="btn black dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-delay="1000" data-close-others="true">Inverse <i class="fa fa-angle-down"></i>
																	</button>
																	<ul class="dropdown-menu bottom-up">
																		<li>
																			<a href="#">
																			Action </a>
																		</li>
																		<li>
																			<a href="#">
																			Another action </a>
																		</li>
																		<li>
																			<a href="#">
																			Something else here </a>
																		</li>
																		<li class="divider">
																		</li>
																		<li>
																			<a href="#">
																			Separated link </a>
																		</li>
																	</ul>
																</div>
																<p>
																	<span class="label label-success">
																	NOTE: </span>
																	&nbsp; By adding <code>bottom-up</code> class you make dropup menu.
																</p>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
										<!-- END DROPDOWNS PORTLET-->
										<!-- BEGIN DROPDOWNS PORTLET-->
										<div class="portlet box green">
											<div class="portlet-title">
												<div class="caption">
													<i class="fa fa-gift"></i> Button Dropdowns
												</div>
											</div>
											<div class="portlet-body util-btn-group-margin-bottom-5">
												<div class="clearfix">
													<h4 class="block">Default Bootstrap Style</h4>
													<div class="btn-group">
														<button type="button" class="btn btn-default">Default</button>
														<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown"><i class="fa fa-angle-down"></i></button>
														<ul class="dropdown-menu" role="menu">
															<li>
																<a href="#">
																Action </a>
															</li>
															<li>
																<a href="#">
																Another action </a>
															</li>
															<li>
																<a href="#">
																Something else here </a>
															</li>
															<li class="divider">
															</li>
															<li>
																<a href="#">
																Separated link </a>
															</li>
														</ul>
													</div>
													<!-- /btn-group -->
													<div class="btn-group">
														<button type="button" class="btn btn-primary">Primary</button>
														<button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown"><i class="fa fa-angle-down"></i></button>
														<ul class="dropdown-menu" role="menu">
															<li>
																<a href="#">
																Action </a>
															</li>
															<li>
																<a href="#">
																Another action </a>
															</li>
															<li>
																<a href="#">
																Something else here </a>
															</li>
															<li class="divider">
															</li>
															<li>
																<a href="#">
																Separated link </a>
															</li>
														</ul>
													</div>
													<!-- /btn-group -->
													<div class="btn-group">
														<button type="button" class="btn btn-success">Success</button>
														<button type="button" class="btn btn-success dropdown-toggle" data-toggle="dropdown"><i class="fa fa-angle-down"></i></button>
														<ul class="dropdown-menu" role="menu">
															<li>
																<a href="#">
																Action </a>
															</li>
															<li>
																<a href="#">
																Another action </a>
															</li>
															<li>
																<a href="#">
																Something else here </a>
															</li>
															<li class="divider">
															</li>
															<li>
																<a href="#">
																Separated link </a>
															</li>
														</ul>
													</div>
													<!-- /btn-group -->
													<div class="btn-group">
														<button type="button" class="btn btn-info">Info</button>
														<button type="button" class="btn btn-info dropdown-toggle" data-toggle="dropdown"><i class="fa fa-angle-down"></i></button>
														<ul class="dropdown-menu" role="menu">
															<li>
																<a href="#">
																Action </a>
															</li>
															<li>
																<a href="#">
																Another action </a>
															</li>
															<li>
																<a href="#">
																Something else here </a>
															</li>
															<li class="divider">
															</li>
															<li>
																<a href="#">
																Separated link </a>
															</li>
														</ul>
													</div>
													<!-- /btn-group -->
													<div class="btn-group">
														<button type="button" class="btn btn-warning">Warning</button>
														<button type="button" class="btn btn-warning dropdown-toggle" data-toggle="dropdown"><i class="fa fa-angle-down"></i></button>
														<ul class="dropdown-menu" role="menu">
															<li>
																<a href="#">
																Action </a>
															</li>
															<li>
																<a href="#">
																Another action </a>
															</li>
															<li>
																<a href="#">
																Something else here </a>
															</li>
															<li class="divider">
															</li>
															<li>
																<a href="#">
																Separated link </a>
															</li>
														</ul>
													</div>
													<!-- /btn-group -->
													<div class="btn-group">
														<button type="button" class="btn btn-danger">Danger</button>
														<button type="button" class="btn btn-danger dropdown-toggle" data-toggle="dropdown"><i class="fa fa-angle-down"></i></button>
														<ul class="dropdown-menu" role="menu">
															<li>
																<a href="#">
																Action </a>
															</li>
															<li>
																<a href="#">
																Another action </a>
															</li>
															<li>
																<a href="#">
																Something else here </a>
															</li>
															<li class="divider">
															</li>
															<li>
																<a href="#">
																Separated link </a>
															</li>
														</ul>
													</div>
													<!-- /btn-group -->
												</div>
												<div class="clearfix">
													<h4 class="block">Metronic Style</h4>
													<div class="btn-group">
														<button type="button" class="btn default">Default</button>
														<button type="button" class="btn default dropdown-toggle" data-toggle="dropdown"><i class="fa fa-angle-down"></i></button>
														<ul class="dropdown-menu" role="menu">
															<li>
																<a href="#">
																Action </a>
															</li>
															<li>
																<a href="#">
																Another action </a>
															</li>
															<li>
																<a href="#">
																Something else here </a>
															</li>
															<li class="divider">
															</li>
															<li>
																<a href="#">
																Separated link </a>
															</li>
														</ul>
													</div>
													<!-- /btn-group -->
													<div class="btn-group">
														<button type="button" class="btn blue">Blue</button>
														<button type="button" class="btn blue dropdown-toggle" data-toggle="dropdown"><i class="fa fa-angle-down"></i></button>
														<ul class="dropdown-menu" role="menu">
															<li>
																<a href="#">
																Action </a>
															</li>
															<li>
																<a href="#">
																Another action </a>
															</li>
															<li>
																<a href="#">
																Something else here </a>
															</li>
															<li class="divider">
															</li>
															<li>
																<a href="#">
																Separated link </a>
															</li>
														</ul>
													</div>
													<!-- /btn-group -->
													<div class="btn-group">
														<button type="button" class="btn green">Green</button>
														<button type="button" class="btn green dropdown-toggle" data-toggle="dropdown"><i class="fa fa-angle-down"></i></button>
														<ul class="dropdown-menu" role="menu">
															<li>
																<a href="#">
																Action </a>
															</li>
															<li>
																<a href="#">
																Another action </a>
															</li>
															<li>
																<a href="#">
																Something else here </a>
															</li>
															<li class="divider">
															</li>
															<li>
																<a href="#">
																Separated link </a>
															</li>
														</ul>
													</div>
													<!-- /btn-group -->
													<div class="btn-group">
														<button type="button" class="btn red">Red</button>
														<button type="button" class="btn red dropdown-toggle" data-toggle="dropdown"><i class="fa fa-angle-down"></i></button>
														<ul class="dropdown-menu" role="menu">
															<li>
																<a href="#">
																Action </a>
															</li>
															<li>
																<a href="#">
																Another action </a>
															</li>
															<li>
																<a href="#">
																Something else here </a>
															</li>
															<li class="divider">
															</li>
															<li>
																<a href="#">
																Separated link </a>
															</li>
														</ul>
													</div>
													<!-- /btn-group -->
													<div class="btn-group">
														<button type="button" class="btn yellow">Yellow</button>
														<button type="button" class="btn yellow dropdown-toggle" data-toggle="dropdown"><i class="fa fa-angle-down"></i></button>
														<ul class="dropdown-menu" role="menu">
															<li>
																<a href="#">
																Action </a>
															</li>
															<li>
																<a href="#">
																Another action </a>
															</li>
															<li>
																<a href="#">
																Something else here </a>
															</li>
															<li class="divider">
															</li>
															<li>
																<a href="#">
																Separated link </a>
															</li>
														</ul>
													</div>
													<!-- /btn-group -->
													<div class="btn-group">
														<button type="button" class="btn dark">Dark</button>
														<button type="button" class="btn dark dropdown-toggle" data-toggle="dropdown"><i class="fa fa-angle-down"></i></button>
														<ul class="dropdown-menu" role="menu">
															<li>
																<a href="#">
																Action </a>
															</li>
															<li>
																<a href="#">
																Another action </a>
															</li>
															<li>
																<a href="#">
																Something else here </a>
															</li>
															<li class="divider">
															</li>
															<li>
																<a href="#">
																Separated link </a>
															</li>
														</ul>
													</div>
													<!-- /btn-group -->
													<div class="btn-group">
														<button type="button" class="btn purple">Purple</button>
														<button type="button" class="btn purple dropdown-toggle" data-toggle="dropdown"><i class="fa fa-angle-down"></i></button>
														<ul class="dropdown-menu" role="menu">
															<li>
																<a href="#">
																Action </a>
															</li>
															<li>
																<a href="#">
																Another action </a>
															</li>
															<li>
																<a href="#">
																Something else here </a>
															</li>
															<li class="divider">
															</li>
															<li>
																<a href="#">
																Separated link </a>
															</li>
														</ul>
													</div>
													<!-- /btn-group -->
												</div>
												<div class="clearfix">
													<h4 class="block">Dropdowns with Multilevel Submenu</h4>
													<!-- Large button group -->
													<div class="btn-group">
														<button class="btn blue dropdown-toggle" type="button" data-toggle="dropdown">
														Dropdown <i class="fa fa-angle-down"></i>
														</button>
														<ul class="dropdown-menu" role="menu">
															<li>
																<a href="#">
																Action </a>
															</li>
															<li>
																<a href="#">
																Another action </a>
															</li>
															<li>
																<a href="#">
																Something else here </a>
															</li>
															<li class="divider">
															</li>
															<li class="dropdown-submenu">
																<a href="javascript:;">
																More options </a>
																<ul class="dropdown-menu" style="">
																	<li>
																		<a href="#">
																		Second level link </a>
																	</li>
																	<li class="dropdown-submenu">
																		<a href="javascript:;">
																		More options </a>
																		<ul class="dropdown-menu">
																			<li>
																				<a href="index.html">
																				Third level link </a>
																			</li>
																			<li>
																				<a href="index.html">
																				Third level link </a>
																			</li>
																			<li>
																				<a href="index.html">
																				Third level link </a>
																			</li>
																			<li>
																				<a href="index.html">
																				Third level link </a>
																			</li>
																			<li>
																				<a href="index.html">
																				Third level link </a>
																			</li>
																		</ul>
																	</li>
																	<li>
																		<a href="index.html">
																		Second level link </a>
																	</li>
																	<li>
																		<a href="index.html">
																		Second level link </a>
																	</li>
																	<li>
																		<a href="index.html">
																		Second level link </a>
																	</li>
																</ul>
															</li>
														</ul>
													</div>
													<div class="btn-group dropup">
														<button class="btn green dropdown-toggle" type="button" data-toggle="dropdown">
														Dropup <i class="fa fa-angle-up"></i>
														</button>
														<ul class="dropdown-menu pull-right" role="menu">
															<li>
																<a href="#">
																Action </a>
															</li>
															<li>
																<a href="#">
																Another action </a>
															</li>
															<li>
																<a href="#">
																Something else here </a>
															</li>
															<li class="divider">
															</li>
															<li class="dropdown-submenu">
																<a href="javascript:;">
																More options </a>
																<ul class="dropdown-menu" style="">
																	<li>
																		<a href="#">
																		Second level link </a>
																	</li>
																	<li class="dropdown-submenu">
																		<a href="javascript:;">
																		More options </a>
																		<ul class="dropdown-menu pull-right">
																			<li>
																				<a href="index.html">
																				Third level link </a>
																			</li>
																			<li>
																				<a href="index.html">
																				Third level link </a>
																			</li>
																			<li>
																				<a href="index.html">
																				Third level link </a>
																			</li>
																			<li>
																				<a href="index.html">
																				Third level link </a>
																			</li>
																			<li>
																				<a href="index.html">
																				Third level link </a>
																			</li>
																		</ul>
																	</li>
																	<li>
																		<a href="index.html">
																		Second level link </a>
																	</li>
																	<li>
																		<a href="index.html">
																		Second level link </a>
																	</li>
																	<li>
																		<a href="index.html">
																		Second level link </a>
																	</li>
																</ul>
															</li>
														</ul>
													</div>
												</div>
												<div class="clearfix">
													<h4 class="block">Sizing</h4>
													<!-- Large button group -->
													<div class="btn-group">
														<button class="btn btn-default btn-lg dropdown-toggle" type="button" data-toggle="dropdown">
														Large button <i class="fa fa-angle-down"></i>
														</button>
														<ul class="dropdown-menu" role="menu">
															<li>
																<a href="#">
																Action </a>
															</li>
															<li>
																<a href="#">
																Another action </a>
															</li>
															<li>
																<a href="#">
																Something else here </a>
															</li>
															<li class="divider">
															</li>
															<li>
																<a href="#">
																Separated link </a>
															</li>
														</ul>
													</div>
													<!-- Small button group -->
													<div class="btn-group">
														<button class="btn btn-default btn-sm dropdown-toggle" type="button" data-toggle="dropdown">
														Small button <i class="fa fa-angle-down"></i>
														</button>
														<ul class="dropdown-menu" role="menu">
															<li>
																<a href="#">
																Action </a>
															</li>
															<li>
																<a href="#">
																Another action </a>
															</li>
															<li>
																<a href="#">
																Something else here </a>
															</li>
															<li class="divider">
															</li>
															<li>
																<a href="#">
																Separated link </a>
															</li>
														</ul>
													</div>
													<!-- Extra small button group -->
													<div class="btn-group">
														<button class="btn btn-default btn-xs dropdown-toggle" type="button" data-toggle="dropdown">
														Extra small button <i class="fa fa-angle-down"></i>
														</button>
														<ul class="dropdown-menu" role="menu">
															<li>
																<a href="#">
																Action </a>
															</li>
															<li>
																<a href="#">
																Another action </a>
															</li>
															<li>
																<a href="#">
																Something else here </a>
															</li>
															<li class="divider">
															</li>
															<li>
																<a href="#">
																Separated link </a>
															</li>
														</ul>
													</div>
													<div class="clearfix margin-bottom-10">
													</div>
													<!-- Large button group -->
													<div class="btn-group">
														<button class="btn red btn-lg dropdown-toggle" type="button" data-toggle="dropdown">
														Large button <i class="fa fa-angle-down"></i>
														</button>
														<ul class="dropdown-menu" role="menu">
															<li>
																<a href="#">
																Action </a>
															</li>
															<li>
																<a href="#">
																Another action </a>
															</li>
															<li>
																<a href="#">
																Something else here </a>
															</li>
															<li class="divider">
															</li>
															<li>
																<a href="#">
																Separated link </a>
															</li>
														</ul>
													</div>
													<!-- Small button group -->
													<div class="btn-group">
														<button class="btn blue btn-sm dropdown-toggle" type="button" data-toggle="dropdown">
														Small button <i class="fa fa-angle-down"></i>
														</button>
														<ul class="dropdown-menu" role="menu">
															<li>
																<a href="#">
																Action </a>
															</li>
															<li>
																<a href="#">
																Another action </a>
															</li>
															<li>
																<a href="#">
																Something else here </a>
															</li>
															<li class="divider">
															</li>
															<li>
																<a href="#">
																Separated link </a>
															</li>
														</ul>
													</div>
													<!-- Extra small button group -->
													<div class="btn-group">
														<button class="btn green btn-xs dropdown-toggle" type="button" data-toggle="dropdown">
														Extra small button <i class="fa fa-angle-down"></i>
														</button>
														<ul class="dropdown-menu" role="menu">
															<li>
																<a href="#">
																Action </a>
															</li>
															<li>
																<a href="#">
																Another action </a>
															</li>
															<li>
																<a href="#">
																Something else here </a>
															</li>
															<li class="divider">
															</li>
															<li>
																<a href="#">
																Separated link </a>
															</li>
														</ul>
													</div>
												</div>
												<div class="clearfix">
													<h4 class="block">Dropup</h4>
													<div class="btn-toolbar margin-bottom-10">
														<div class="btn-group dropup">
															<button type="button" class="btn btn-default">Dropup</button>
															<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown"><i class="fa fa-angle-up"></i></button>
															<ul class="dropdown-menu" role="menu">
																<li>
																	<a href="#">
																	Action </a>
																</li>
																<li>
																	<a href="#">
																	Another action </a>
																</li>
																<li>
																	<a href="#">
																	Something else here </a>
																</li>
																<li class="divider">
																</li>
																<li>
																	<a href="#">
																	Separated link </a>
																</li>
															</ul>
														</div>
														<!-- /btn-group -->
														<div class="btn-group dropup">
															<button type="button" class="btn btn-primary">Right dropup</button>
															<button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown"><i class="fa fa-angle-up"></i></button>
															<ul class="dropdown-menu pull-right" role="menu">
																<li>
																	<a href="#">
																	Action </a>
																</li>
																<li>
																	<a href="#">
																	Another action </a>
																</li>
																<li>
																	<a href="#">
																	Something else here </a>
																</li>
																<li class="divider">
																</li>
																<li>
																	<a href="#">
																	Separated link </a>
																</li>
															</ul>
														</div>
														<!-- /btn-group -->
													</div>
													<div class="btn-toolbar">
														<div class="btn-group dropup">
															<button type="button" class="btn blue">Dropup</button>
															<button type="button" class="btn blue dropdown-toggle" data-toggle="dropdown"><i class="fa fa-angle-up"></i></button>
															<ul class="dropdown-menu" role="menu">
																<li>
																	<a href="#">
																	Action </a>
																</li>
																<li>
																	<a href="#">
																	Another action </a>
																</li>
																<li>
																	<a href="#">
																	Something else here </a>
																</li>
																<li class="divider">
																</li>
																<li>
																	<a href="#">
																	Separated link </a>
																</li>
															</ul>
														</div>
														<!-- /btn-group -->
														<div class="btn-group dropup">
															<button type="button" class="btn green">Right dropup</button>
															<button type="button" class="btn green dropdown-toggle" data-toggle="dropdown"><i class="fa fa-angle-up"></i></button>
															<ul class="dropdown-menu pull-right" role="menu">
																<li>
																	<a href="#">
																	Action </a>
																</li>
																<li>
																	<a href="#">
																	Another action </a>
																</li>
																<li>
																	<a href="#">
																	Something else here </a>
																</li>
																<li class="divider">
																</li>
																<li>
																	<a href="#">
																	Separated link </a>
																</li>
															</ul>
														</div>
														<!-- /btn-group -->
													</div>
												</div>
												<div class="clearfix">
													<h4 class="block">Hoveralbe Dropdowns</h4>
													<div class="btn-toolbar margin-bottom-10">
														<div class="btn-group">
															<button type="button" class="btn btn-default">Dropdown</button>
															<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-delay="1000" data-close-others="true"><i class="fa fa-angle-down"></i></button>
															<ul class="dropdown-menu" role="menu">
																<li>
																	<a href="#">
																	Action </a>
																</li>
																<li>
																	<a href="#">
																	Another action </a>
																</li>
																<li>
																	<a href="#">
																	Something else here </a>
																</li>
																<li class="divider">
																</li>
																<li>
																	<a href="#">
																	Separated link </a>
																</li>
															</ul>
														</div>
														<!-- /btn-group -->
														<div class="btn-group dropup">
															<button type="button" class="btn btn-primary">Dropup</button>
															<button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-delay="1000" data-close-others="true"><i class="fa fa-angle-up"></i></button>
															<ul class="dropdown-menu" role="menu">
																<li>
																	<a href="#">
																	Action </a>
																</li>
																<li>
																	<a href="#">
																	Another action </a>
																</li>
																<li>
																	<a href="#">
																	Something else here </a>
																</li>
																<li class="divider">
																</li>
																<li>
																	<a href="#">
																	Separated link </a>
																</li>
															</ul>
														</div>
														<!-- /btn-group -->
														<div class="btn-group">
															<button type="button" class="btn btn-success dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-delay="1000" data-close-others="true">
															Dropup <i class="fa fa-angle-down"></i>
															</button>
															<ul class="dropdown-menu" role="menu">
																<li>
																	<a href="#">
																	Action </a>
																</li>
																<li>
																	<a href="#">
																	Another action </a>
																</li>
																<li>
																	<a href="#">
																	Something else here </a>
																</li>
																<li class="divider">
																</li>
																<li>
																	<a href="#">
																	Separated link </a>
																</li>
															</ul>
														</div>
														<!-- /btn-group -->
													</div>
													<div class="btn-toolbar">
														<div class="btn-group">
															<button type="button" class="btn blue">Dropdown</button>
															<button type="button" class="btn blue dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-delay="1000" data-close-others="true"><i class="fa fa-angle-down"></i></button>
															<ul class="dropdown-menu" role="menu">
																<li>
																	<a href="#">
																	Action </a>
																</li>
																<li>
																	<a href="#">
																	Another action </a>
																</li>
																<li>
																	<a href="#">
																	Something else here </a>
																</li>
																<li class="divider">
																</li>
																<li>
																	<a href="#">
																	Separated link </a>
																</li>
															</ul>
														</div>
														<!-- /btn-group -->
														<div class="btn-group dropup">
															<button type="button" class="btn green">Dropup</button>
															<button type="button" class="btn green dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-delay="1000" data-close-others="true">
															<i class="fa fa-angle-up"></i></button>
															<ul class="dropdown-menu" role="menu">
																<li>
																	<a href="#">
																	Action </a>
																</li>
																<li>
																	<a href="#">
																	Another action </a>
																</li>
																<li>
																	<a href="#">
																	Something else here </a>
																</li>
																<li class="divider">
																</li>
																<li>
																	<a href="#">
																	Separated link </a>
																</li>
															</ul>
														</div>
														<!-- /btn-group -->
														<div class="btn-group">
															<button type="button" class="btn yellow dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-delay="1000" data-close-others="true">
															Dropdown <i class="fa fa-angle-down"></i>
															</button>
															<ul class="dropdown-menu" role="menu">
																<li>
																	<a href="#">
																	Action </a>
																</li>
																<li>
																	<a href="#">
																	Another action </a>
																</li>
																<li>
																	<a href="#">
																	Something else here </a>
																</li>
																<li class="divider">
																</li>
																<li>
																	<a href="#">
																	Separated link </a>
																</li>
															</ul>
														</div>
														<!-- /btn-group -->
													</div>
												</div>
												<div class="clearfix">
													<h4 class="block">Dropdown with Checkboxes & Search Form</h4>
													<div class="btn-group">
														<button class="btn green dropdown-toggle" type="button" data-toggle="dropdown">
														Search Dropdown <i class="fa fa-angle-down"></i>
														</button>
														<div class="dropdown-menu dropdown-content input-large hold-on-click" role="menu">
															<form action="#">
																<div class="input-group">
																	<input type="text" class="form-control" placeholder="search...">
																	<span class="input-group-btn">
																	<button class="btn blue" type="submit">Go!</button>
																	</span>
																</div>
															</form>
														</div>
													</div>
													<div class="btn-group">
														<button type="button" class="btn blue">Dropdown</button>
														<button type="button" class="btn blue dropdown-toggle" data-toggle="dropdown"><i class="fa fa-angle-down"></i></button>
														<div class="dropdown-menu hold-on-click dropdown-checkboxes" role="menu">
															<label><input type="checkbox">Option 1</label>
															<label><input type="checkbox" checked>Option 2</label>
															<label><input type="checkbox">Option 3</label>
															<label><input type="checkbox" checked>Option 4</label>
															<label><input type="checkbox">Option 5</label>
														</div>
													</div>
													<!-- /btn-group -->
													<div class="btn-group dropup">
														<button type="button" class="btn green">Dropup</button>
														<button type="button" class="btn green dropdown-toggle" data-toggle="dropdown"><i class="fa fa-angle-up"></i></button>
														<div class="dropdown-menu hold-on-click dropdown-checkboxes" role="menu">
															<label><input type="checkbox">Option 1</label>
															<label><input type="checkbox" checked>Option 2</label>
															<label><input type="checkbox">Option 3</label>
															<label><input type="checkbox" checked>Option 4</label>
															<label><input type="checkbox">Option 5</label>
														</div>
													</div>
													<!-- /btn-group -->
													<div class="clearfix margin-top-10">
														<span class="label label-success">
														NOTE: </span>
														&nbsp; By adding <code>hold-on-click</code> class you can avoid closing the dropdown on click
													</div>
												</div>
												<div class="clearfix">
													<h4 class="block">Dropdown with Radio Buttons</h4>
													<div class="btn-group">
														<button type="button" class="btn blue">Dropdown</button>
														<button type="button" class="btn blue dropdown-toggle" data-toggle="dropdown"><i class="fa fa-angle-down"></i></button>
														<div class="dropdown-menu hold-on-click dropdown-radiobuttons" role="menu">
															<label><input type="radio" name="radio_button_1">Option 1</label>
															<label><input type="radio" name="radio_button_1">Option 2</label>
															<label><input type="radio" name="radio_button_1">Option 3</label>
															<label><input type="radio" name="radio_button_1">Option 4</label>
															<label><input type="radio" name="radio_button_1">Option 5</label>
														</div>
													</div>
													<!-- /btn-group -->
													<div class="btn-group dropup">
														<button type="button" class="btn green">Dropup</button>
														<button type="button" class="btn green dropdown-toggle" data-toggle="dropdown"><i class="fa fa-angle-up"></i></button>
														<div class="dropdown-menu hold-on-click dropdown-radiobuttons" role="menu">
															<label><input type="radio" name="radio_button_2">Option 1</label>
															<label><input type="radio" name="radio_button_2">Option 2</label>
															<label><input type="radio" name="radio_button_2">Option 3</label>
															<label><input type="radio" name="radio_button_2">Option 4</label>
															<label><input type="radio" name="radio_button_2">Option 5</label>
														</div>
													</div>
													<!-- /btn-group -->
													<div class="clearfix margin-top-10">
														<span class="label label-success">
														NOTE: </span>
														&nbsp; By adding <code>hold-on-click</code> class you can avoid closing the dropdown on click
													</div>
												</div>
											</div>
											<!-- END DROPDOWNS PORTLET-->
										</div>
										<div class="portlet box green util-btn-group-margin-bottom-5">
											<div class="portlet-title">
												<div class="caption">
													<i class="fa fa-gift"></i>
													<span class="hidden-480">
													Button States </span>
												</div>
											</div>
											<div class="portlet-body util-btn-margin-bottom-5">
												<h4>Loading State</h4>
												<div class="clearfix">
													<button type="button" data-loading-text="Loading..." class="demo-loading-btn btn btn-primary">
													Loading state </button>
													<button type="button" data-loading-text="Loading..." class="demo-loading-btn btn btn-default">
													Loading state </button>
													<button type="button" data-loading-text="Loading..." class="demo-loading-btn btn red">
													Loading state </button>
													<button type="button" data-loading-text="Loading..." class="demo-loading-btn btn blue">
													Loading state </button>
												</div>
												<h4>Single Toggle</h4>
												<div class="clearfix">
													<button type="button" class="btn btn-primary" data-toggle="button">
													Single toggle </button>
													<button type="button" class="btn btn-default" data-toggle="button">
													Single toggle </button>
													<button type="button" class="btn red" data-toggle="button">
													Single toggle </button>
													<button type="button" class="btn blue" data-toggle="button">
													Single toggle </button>
												</div>
												<h4>Checkbox</h4>
												<div class="clearfix">
													<div class="btn-group" data-toggle="buttons">
														<label class="btn default active">
														<input type="checkbox" class="toggle"> Option 1 </label>
														<label class="btn default">
														<input type="checkbox" class="toggle"> Option 2 </label>
														<label class="btn default">
														<input type="checkbox" class="toggle"> Option 3 </label>
													</div>
												</div>
												<div class="clearfix">
													<div class="btn-group" data-toggle="buttons">
														<label class="btn btn-default">
														<input type="checkbox" class="toggle"> Option 1 </label>
														<label class="btn btn-default active">
														<input type="checkbox" class="toggle"> Option 2 </label>
														<label class="btn btn-default">
														<input type="checkbox" class="toggle"> Option 3 </label>
													</div>
												</div>
												<h4>Radio</h4>
												<div class="clearfix">
													<div class="btn-group" data-toggle="buttons">
														<label class="btn blue active">
														<input type="radio" class="toggle"> Option 1 </label>
														<label class="btn blue">
														<input type="radio" class="toggle"> Option 2 </label>
														<label class="btn blue">
														<input type="radio" class="toggle"> Option 3 </label>
													</div>
												</div>
												<div class="clearfix">
													<div class="btn-group" data-toggle="buttons">
														<label class="btn btn-default active">
														<input type="radio" class="toggle"> Option 1 </label>
														<label class="btn btn-default">
														<input type="radio" class="toggle"> Option 2 </label>
														<label class="btn btn-default">
														<input type="radio" class="toggle"> Option 3 </label>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="tab-pane" id="tab_1_2">
								<div class="row">
									<div class="col-md-6">
										<!-- BEGIN BUTTONS PORTLET-->
										<div class="portlet box green ">
											<div class="portlet-title">
												<div class="caption">
													<i class="fa fa-gift"></i>Buttons
												</div>
												<div class="tools">
													<a href="javascript:;" class="collapse">
													</a>
													<a href="#portlet-config" data-toggle="modal" class="config">
													</a>
													<a href="javascript:;" class="reload">
													</a>
													<a href="javascript:;" class="remove">
													</a>
												</div>
											</div>
											<div class="portlet-body util-btn-margin-bottom-5">
												<div class="clearfix">
													<h4 class="block">Default Bootstrap Buttons(Customized to Match Theme Style)</h4>
													<!-- Standard gray button with gradient -->
													<button type="button" class="btn btn-circle btn-default">Default</button>
													<!-- Provides extra visual weight and identifies the primary action in a set of buttons -->
													<button type="button" class="btn btn-circle btn-primary">Primary</button>
													<!-- Indicates a successful or positive action -->
													<button type="button" class="btn btn-circle btn-success">Success</button>
													<!-- Contextual button for informational alert messages -->
													<button type="button" class="btn btn-circle btn-info">Info</button>
													<!-- Indicates caution should be taken with this action -->
													<button type="button" class="btn btn-circle btn-warning">Warning</button>
													<!-- Indicates a dangerous or potentially negative action -->
													<button type="button" class="btn btn-circle btn-danger">Danger</button>
													<!-- Deemphasize a button by making it look like a link while maintaining button behavior -->
													<button type="button" class="btn btn-circle btn-link">Link</button>
												</div>
												<div class="clearfix">
													<h4 class="block">Metronic Style Buttons</h4>
													<button type="button" class="btn btn-circle default">Default</button>
													<button type="button" class="btn btn-circle red">Red</button>
													<button type="button" class="btn btn-circle blue">Blue</button>
													<button type="button" class="btn btn-circle green">Green</button>
													<button type="button" class="btn btn-circle yellow">Yellow</button>
													<button type="button" class="btn btn-circle purple">Purple</button>
													<button type="button" class="btn btn-circle dark">Dark</button>
												</div>
												<div class="clearfix">
													<h4 class="block">More Button Colors(go to <a href="ui_colors.html">
													ui_colors.html </a>
													for more colors)</h4>
													<button type="button" class="btn btn-circle blue-hoki">Blue Hoki</button>
													<button type="button" class="btn btn-circle blue-madison">Blue Madison</button>
													<button type="button" class="btn btn-circle green-meadow">Green Meadow</button>
													<button type="button" class="btn btn-circle red-sunglo">Red Sunglo</button>
													<button type="button" class="btn btn-circle yellow-crusta">Yellow Crusta</button>
													<button type="button" class="btn btn-circle purple-plum">Purple Plum</button>
													<button type="button" class="btn btn-circle grey-cascade">Grey Cascade</button>
												</div>
												<div class="clearfix">
													<h4 class="block">Button Stripe</h4>
													<a href="#" class="btn btn-circle default red-stripe">
													Red </a>
													<a href="#" class="btn btn-circle default blue-stripe">
													Blue </a>
													<a href="#" class="btn btn-circle default green-stripe">
													Green </a>
													<a href="#" class="btn btn-circle default yellow-stripe">
													Yellow </a>
													<a href="#" class="btn btn-circle default purple-stripe">
													Purple </a>
													<a href="#" class="btn btn-circle default green-stripe">
													Green </a>
													<a href="#" class="btn btn-circle default dark-stripe">
													Dark </a>
												</div>
												<div class="clearfix">
													<h4 class="block">Disabled</h4>
													<a href="#" class="btn btn-circle default disabled">
													Default </a>
													<a href="#" class="btn btn-circle red disabled">
													Red </a>
													<a href="#" class="btn btn-circle blue disabled">
													Blue </a>
													<a href="#" class="btn btn-circle green disabled">
													Green </a>
													<a href="#" class="btn btn-circle yellow disabled">
													Yellow </a>
													<a href="#" class="btn btn-circle purple disabled">
													Purple </a>
													<a href="#" class="btn btn-circle dark disabled">
													Dark </a>
												</div>
												<div class="clearfix">
													<h4 class="block">Button Sizes</h4>
													<button type="button" class="btn btn-circle default btn-lg">Large button</button>
													<button type="button" class="btn btn-circle red">Default button</button>
													<button type="button" class="btn btn-circle blue btn-sm">Small button</button>
													<button type="button" class="btn btn-circle green btn-xs">Extra small button</button>
												</div>
												<div class="clearfix">
													<h4 class="block">Button Tags</h4>
													<a href="#" class="btn btn-circle default">
													Link </a>
													<button class="btn btn-circle default">Button</button>
													<input type="button" class="btn btn-circle default" value="Input">
													<input type="submit" class="btn btn-circle default" value="Submit">
												</div>
												<div class="clearfix">
													<h4 class="block">Block Buttons</h4>
													<a href="#" class="btn btn-circle default btn-block">
													Link </a>
													<button class="btn btn-circle blue btn-block">Button</button>
													<input type="button" class="btn btn-circle red btn-block" value="Input">
													<input type="submit" class="btn btn-circle purple btn-block" value="Submit">
												</div>
											</div>
										</div>
										<!-- END BUTTONS PORTLET-->
										<!-- BEGIN BUTTONS WITH ICONS PORTLET-->
										<div class="portlet box red-pink tabbable">
											<div class="portlet-title">
												<div class="caption">
													<i class="fa fa-gift"></i>
													<span class="hidden-480">
													Buttons </span>
												</div>
											</div>
											<div class="portlet-body util-btn-margin-bottom-5">
												<div class="portlet-tabs">
													<ul class="nav nav-tabs">
														<li>
															<a href="#buttons_metro_circle" data-toggle="tab">
															Metro </a>
														</li>
														<li>
															<a href="#dropdown_glyphicon_circle" data-toggle="tab">
															Glyphicon </a>
														</li>
														<li>
															<a href="#dropdown_simplelineicons_circle" data-toggle="tab">
															Simple Line</a>
														</li>
														<li class="active">
															<a href="#dropdown_fontawesome_circle" data-toggle="tab">
															Fontawesome </a>
														</li>
													</ul>
													<div class="tab-content">
														<div class="tab-pane active" id="dropdown_fontawesome_circle">
															<div class="clearfix">
																<h4 class="block">Large Buttons</h4>
																<a href="#" class="btn btn-circle btn-lg default">
																Default <i class="fa fa-user"></i>
																</a>
																<a href="#" class="btn btn-circle btn-lg red">
																Red <i class="fa fa-edit"></i>
																</a>
																<a href="#" class="btn btn-circle btn-lg blue">
																<i class="fa fa-file-o"></i> Blue </a>
																<a href="#" class="btn btn-circle btn-lg green">
																Green <i class="fa fa-font"></i>
																</a>
																<a href="#" class="btn btn-circle btn-lg yellow">
																Yellow <i class="fa fa-search"></i>
																</a>
																<a href="#" class="btn btn-circle btn-lg purple">
																<i class="fa fa-times"></i> Purple </a>
																<a href="#" class="btn btn-circle btn-lg green">
																Green <i class="fa fa-plus"></i>
																</a>
																<a href="#" class="btn btn-circle btn-lg grey-cascade">
																Dark <i class="fa fa-link"></i>
																</a>
															</div>
															<div class="clearfix">
																<h4 class="block">Default Buttons</h4>
																<a href="#" class="btn btn-circle default">
																Default <i class="fa fa-user"></i>
																</a>
																<a href="#" class="btn btn-circle red">
																Red <i class="fa fa-edit"></i>
																</a>
																<a href="#" class="btn btn-circle blue">
																<i class="fa fa-file-o"></i> Blue </a>
																<a href="#" class="btn btn-circle green">
																Green <i class="fa fa-font"></i>
																</a>
																<a href="#" class="btn btn-circle yellow">
																Yellow <i class="fa fa-search"></i>
																</a>
																<a href="#" class="btn btn-circle purple">
																<i class="fa fa-times"></i> Purple </a>
																<a href="#" class="btn btn-circle green">
																Green <i class="fa fa-plus"></i>
																</a>
																<a href="#" class="btn btn-circle grey-cascade">
																Dark <i class="fa fa-link"></i>
																</a>
															</div>
															<div class="clearfix">
																<h4 class="block">Small Buttons</h4>
																<a href="#" class="btn btn-circle btn-sm default">
																Default <i class="fa fa-user"></i>
																</a>
																<a href="#" class="btn btn-circle btn-sm red">
																Red <i class="fa fa-edit"></i>
																</a>
																<a href="#" class="btn btn-circle btn-sm blue">
																<i class="fa fa-file-o"></i> Blue </a>
																<a href="#" class="btn btn-circle btn-sm green">
																Green <i class="fa fa-font"></i>
																</a>
																<a href="#" class="btn btn-circle btn-sm yellow">
																Yellow <i class="fa fa-search"></i>
																</a>
																<a href="#" class="btn btn-circle btn-sm purple">
																<i class="fa fa-times"></i> Purple </a>
																<a href="#" class="btn btn-circle btn-sm green">
																Green <i class="fa fa-plus"></i>
																</a>
																<a href="#" class="btn btn-circle btn-sm grey-cascade">
																Dark <i class="fa fa-link"></i>
																</a>
															</div>
															<div class="clearfix">
																<h4 class="block">Extra Small</h4>
																<a href="#" class="btn btn-circle btn-xs default">
																Default <i class="fa fa-user"></i>
																</a>
																<a href="#" class="btn btn-circle btn-xs red">
																Red <i class="fa fa-edit"></i>
																</a>
																<a href="#" class="btn btn-circle btn-xs blue">
																<i class="fa fa-file-o"></i> Blue </a>
																<a href="#" class="btn btn-circle btn-xs green">
																Green <i class="fa fa-font"></i>
																</a>
																<a href="#" class="btn btn-circle btn-xs yellow">
																Yellow <i class="fa fa-search"></i>
																</a>
																<a href="#" class="btn btn-circle btn-xs purple">
																<i class="fa fa-times"></i> Purple </a>
																<a href="#" class="btn btn-circle btn-xs green">
																Green <i class="fa fa-plus"></i>
																</a>
																<a href="#" class="btn btn-circle btn-xs grey-cascade">
																Dark <i class="fa fa-link"></i>
																</a>
															</div>
															<div class="clearfix">
																<h4 class="block">Font Awesome</h4>
																<a href="#" class="btn btn-icon-only btn-circle default">
																<i class="fa fa-user"></i>
																</a>
																<a href="#" class="btn btn-icon-only btn-circle red">
																<i class="fa fa-edit"></i>
																</a>
																<a href="#" class="btn btn-icon-only btn-circle blue">
																<i class="fa fa-file-o"></i>
																</a>
																<a href="#" class="btn btn-icon-only btn-circle green">
																<i class="fa fa-font"></i>
																</a>
																<a href="#" class="btn btn-icon-only btn-circle yellow">
																<i class="fa fa-search"></i>
																</a>
																<a href="#" class="btn btn-icon-only btn-circle purple">
																<i class="fa fa-times"></i>
																</a>
																<a href="#" class="btn btn-icon-only btn-circle green">
																<i class="fa fa-plus"></i>
																</a>
																<a href="#" class="btn btn-icon-only btn-circle grey-cascade">
																<i class="fa fa-link"></i>
																</a>
															</div>
														</div>
														<div class="tab-pane" id="dropdown_glyphicon_circle">
															<div class="clearfix">
																<h4 class="block">Large Buttons</h4>
																<a href="#" class="btn btn-circle btn-lg default">
																Default <span class="glyphicon glyphicon-cog">
																</span>
																</a>
																<a href="#" class="btn btn-circle btn-lg red">
																Red <span class="glyphicon glyphicon-calendar">
																</span>
																</a>
																<a href="#" class="btn btn-circle btn-lg blue">
																<span class="glyphicon glyphicon-font">
																</span>
																Blue </a>
																<a href="#" class="btn btn-circle btn-lg green">
																Green <span class="glyphicon glyphicon-gift">
																</span>
																</a>
																<a href="#" class="btn btn-circle btn-lg yellow">
																Yellow <span class="glyphicon glyphicon-pencil">
																</span>
																</a>
																<a href="#" class="btn btn-circle btn-lg purple">
																<span class="glyphicon glyphicon-tag">
																</span>
																Purple </a>
																<a href="#" class="btn btn-circle btn-lg green">
																Green <span class="glyphicon glyphicon-user">
																</span>
																</a>
																<a href="#" class="btn btn-circle btn-lg grey-cascade">
																Dark <span class="glyphicon glyphicon-link">
																</span>
																</a>
															</div>
															<div class="clearfix">
																<h4 class="block">Default Buttons</h4>
																<a href="#" class="btn btn-circle default">
																Default <span class="glyphicon glyphicon-cog">
																</span>
																</a>
																<a href="#" class="btn btn-circle red">
																Red <span class="glyphicon glyphicon-calendar">
																</span>
																</a>
																<a href="#" class="btn btn-circle blue">
																<span class="glyphicon glyphicon-font">
																</span>
																Blue </a>
																<a href="#" class="btn btn-circle green">
																Green <span class="glyphicon glyphicon-gift">
																</span>
																</a>
																<a href="#" class="btn btn-circle yellow">
																Yellow <span class="glyphicon glyphicon-pencil">
																</span>
																</a>
																<a href="#" class="btn btn-circle purple">
																<span class="glyphicon glyphicon-tag">
																</span>
																Purple </a>
																<a href="#" class="btn btn-circle green">
																Green <span class="glyphicon glyphicon-user">
																</span>
																</a>
																<a href="#" class="btn btn-circle grey-cascade">
																Dark <span class="glyphicon glyphicon-link">
																</span>
																</a>
															</div>
															<div class="clearfix">
																<h4 class="block">Small Buttons</h4>
																<a href="#" class="btn btn-circle btn-sm default">
																Default <span class="glyphicon glyphicon-cog">
																</span>
																</a>
																<a href="#" class="btn btn-circle btn-sm red">
																Red <span class="glyphicon glyphicon-calendar">
																</span>
																</a>
																<a href="#" class="btn btn-circle btn-sm blue">
																<span class="glyphicon glyphicon-font">
																</span>
																Blue </a>
																<a href="#" class="btn btn-circle btn-sm green">
																Green <span class="glyphicon glyphicon-gift">
																</span>
																</a>
																<a href="#" class="btn btn-circle btn-sm yellow">
																Yellow <span class="glyphicon glyphicon-pencil">
																</span>
																</a>
																<a href="#" class="btn btn-circle btn-sm purple">
																<span class="glyphicon glyphicon-tag">
																</span>
																Purple </a>
																<a href="#" class="btn btn-circle btn-sm green">
																Green <span class="glyphicon glyphicon-user">
																</span>
																</a>
																<a href="#" class="btn btn-circle btn-sm grey-cascade">
																Dark <span class="glyphicon glyphicon-link">
																</span>
																</a>
															</div>
															<div class="clearfix">
																<h4 class="block">Extra Small Buttons</h4>
																<a href="#" class="btn btn-circle btn-xs default">
																Default <span class="glyphicon glyphicon-cog">
																</span>
																</a>
																<a href="#" class="btn btn-circle btn-xs red">
																Red <span class="glyphicon glyphicon-calendar">
																</span>
																</a>
																<a href="#" class="btn btn-circle btn-xs blue">
																<span class="glyphicon glyphicon-font">
																</span>
																Blue </a>
																<a href="#" class="btn btn-circle btn-xs green">
																Green <span class="glyphicon glyphicon-gift">
																</span>
																</a>
																<a href="#" class="btn btn-circle btn-xs yellow">
																Yellow <span class="glyphicon glyphicon-pencil">
																</span>
																</a>
																<a href="#" class="btn btn-circle btn-xs purple">
																<span class="glyphicon glyphicon-tag">
																</span>
																Purple </a>
																<a href="#" class="btn btn-circle btn-xs green">
																Green <span class="glyphicon glyphicon-user">
																</span>
																</a>
																<a href="#" class="btn btn-circle btn-xs grey-cascade">
																Dark <span class="glyphicon glyphicon-link">
																</span>
																</a>
															</div>
															<div class="clearfix">
																<h4 class="block">Icon Only Buttons</h4>
																<a href="#" class="btn btn-icon-only btn-circle default">
																<span class="glyphicon glyphicon-cog">
																</span>
																</a>
																<a href="#" class="btn btn-icon-only btn-circle red">
																<span class="glyphicon glyphicon-calendar">
																</span>
																</a>
																<a href="#" class="btn btn-icon-only btn-circle blue">
																<span class="glyphicon glyphicon-font">
																</span>
																</a>
																<a href="#" class="btn btn-icon-only btn-circle green">
																<span class="glyphicon glyphicon-gift">
																</span>
																</a>
																<a href="#" class="btn btn-icon-only btn-circle yellow">
																<span class="glyphicon glyphicon-pencil">
																</span>
																</a>
																<a href="#" class="btn btn-icon-only btn-circle purple">
																<span class="glyphicon glyphicon-tag">
																</span>
																</a>
																<a href="#" class="btn btn-icon-only btn-circle green">
																<span class="glyphicon glyphicon-user">
																</span>
																</a>
																<a href="#" class="btn btn-icon-only btn-circle grey-cascade">
																<span class="glyphicon glyphicon-link">
																</span>
																</a>
															</div>
														</div>
														<div class="tab-pane" id="dropdown_simplelineicons_circle">
															<div class="clearfix">
																<h4 class="block">Large Buttons</h4>
																<a href="#" class="btn btn-circle btn-lg default">
																Default <span class="icon-social-dribbble">
																</span>
																</a>
																<a href="#" class="btn btn-circle btn-lg red">
																Red <span class="icon-crop">
																</span>
																</a>
																<a href="#" class="btn btn-circle btn-lg blue">
																<span class="icon-screen-desktop">
																</span>
																Blue </a>
																<a href="#" class="btn btn-circle btn-lg green">
																Green <span class="icon-badge">
																</span>
																</a>
																<a href="#" class="btn btn-circle btn-lg yellow">
																Yellow <span class="icon-anchor">
																</span>
																</a>
																<a href="#" class="btn btn-circle btn-lg purple">
																<span class="icon-bell">
																</span>
																Purple </a>
																<a href="#" class="btn btn-circle btn-lg green">
																Green <span class="icon-present">
																</span>
																</a>
																<a href="#" class="btn btn-circle btn-lg grey-cascade">
																Dark <span class="icon-pin">
																</span>
																</a>
															</div>
															<div class="clearfix">
																<h4 class="block">Default Buttons</h4>
																<a href="#" class="btn btn-circle default">
																Default <span class="icon-social-dribbble">
																</span>
																</a>
																<a href="#" class="btn btn-circle red">
																Red <span class="icon-crop">
																</span>
																</a>
																<a href="#" class="btn btn-circle blue">
																<span class="icon-screen-desktop">
																</span>
																Blue </a>
																<a href="#" class="btn btn-circle green">
																Green <span class="icon-badge">
																</span>
																</a>
																<a href="#" class="btn btn-circle yellow">
																Yellow <span class="icon-anchor">
																</span>
																</a>
																<a href="#" class="btn btn-circle purple">
																<span class="icon-bell">
																</span>
																Purple </a>
																<a href="#" class="btn btn-circle green">
																Green <span class="icon-present">
																</span>
																</a>
																<a href="#" class="btn btn-circle grey-cascade">
																Dark <span class="icon-pin">
																</span>
																</a>
															</div>
															<div class="clearfix">
																<h4 class="block">Small Buttons</h4>
																<a href="#" class="btn btn-circle btn-sm default">
																Default <span class="icon-social-dribbble">
																</span>
																</a>
																<a href="#" class="btn btn-circle btn-sm red">
																Red <span class="icon-crop">
																</span>
																</a>
																<a href="#" class="btn btn-circle btn-sm blue">
																<span class="icon-screen-desktop">
																</span>
																Blue </a>
																<a href="#" class="btn btn-circle btn-sm green">
																Green <span class="icon-badge">
																</span>
																</a>
																<a href="#" class="btn btn-circle btn-sm yellow">
																Yellow <span class="icon-anchor">
																</span>
																</a>
																<a href="#" class="btn btn-circle btn-sm purple">
																<span class="icon-bell">
																</span>
																Purple </a>
																<a href="#" class="btn btn-circle btn-sm green">
																Green <span class="icon-present">
																</span>
																</a>
																<a href="#" class="btn btn-circle btn-sm grey-cascade">
																Dark <span class="icon-pin">
																</span>
																</a>
															</div>
															<div class="clearfix">
																<h4 class="block">Extra Small Buttons</h4>
																<a href="#" class="btn btn-circle btn-xs default">
																Default <span class="icon-social-dribbble">
																</span>
																</a>
																<a href="#" class="btn btn-circle btn-xs red">
																Red <span class="icon-crop">
																</span>
																</a>
																<a href="#" class="btn btn-circle btn-xs blue">
																<span class="icon-screen-desktop">
																</span>
																Blue </a>
																<a href="#" class="btn btn-circle btn-xs green">
																Green <span class="icon-badge">
																</span>
																</a>
																<a href="#" class="btn btn-circle btn-xs yellow">
																Yellow <span class="icon-anchor">
																</span>
																</a>
																<a href="#" class="btn btn-circle btn-xs purple">
																<span class="icon-bell">
																</span>
																Purple </a>
																<a href="#" class="btn btn-circle btn-xs green">
																Green <span class="icon-present">
																</span>
																</a>
																<a href="#" class="btn btn-circle btn-xs grey-cascade">
																Dark <span class="icon-pin">
																</span>
																</a>
															</div>
															<div class="clearfix">
																<h4 class="block">Icon Only Buttons</h4>
																<a href="#" class="btn btn-icon-only btn-circle default">
																<span class="icon-social-dribbble">
																</span>
																</a>
																<a href="#" class="btn btn-icon-only btn-circle red">
																<span class="icon-crop">
																</span>
																</a>
																<a href="#" class="btn btn-icon-only btn-circle blue">
																<span class="icon-screen-desktop">
																</span>
																</a>
																<a href="#" class="btn btn-icon-only btn-circle green">
																<span class="icon-badge">
																</span>
																</a>
																<a href="#" class="btn btn-icon-only btn-circle yellow">
																<span class="icon-anchor">
																</span>
																</a>
																<a href="#" class="btn btn-icon-only btn-circle purple">
																<span class="icon-bell">
																</span>
																</a>
																<a href="#" class="btn btn-icon-only btn-circle green">
																<span class="icon-present">
																</span>
																</a>
																<a href="#" class="btn btn-icon-only btn-circle grey-cascade">
																<span class="icon-pin">
																</span>
																</a>
															</div>
														</div>
														<div class="tab-pane " id="buttons_metro_circle">
															<div class="clearfix">
																<h4 class="block">Navigation Large Icons Buttons</h4>
																<a href="#" class="btn btn-circle btn-lg default m-icon-big">
																Submit <i class="m-icon-big-swapleft"></i>
																</a>
																<a href="#" class="btn btn-circle btn-lg green m-icon-big">
																Submit <i class="m-icon-big-swapright m-icon-white"></i>
																</a>
																<a href="#" class="btn btn-circle btn-lg blue m-icon-big">
																Submit <i class="m-icon-big-swapdown m-icon-white"></i>
																</a>
																<a href="#" class="btn btn-circle btn-lg dark m-icon-big">
																Submit <i class="m-icon-big-swapup m-icon-white"></i>
																</a>
															</div>
															<div class="clearfix">
																<h4 class="block">Navigation Large Icons Only Buttons</h4>
																<a href="#" class="btn btn-circle btn-lg default m-icon-big m-icon-only">
																<i class="m-icon-big-swapleft"></i>
																</a>
																<a href="#" class="btn btn-circle btn-lg green m-icon-big m-icon-only">
																<i class="m-icon-big-swapright m-icon-white"></i>
																</a>
																<a href="#" class="btn btn-circle btn-lg blue m-icon-big m-icon-only">
																<i class="m-icon-big-swapdown m-icon-white"></i>
																</a>
																<a href="#" class="btn btn-circle btn-lg dark m-icon-big m-icon-only">
																<i class="m-icon-big-swapup m-icon-white"></i>
																</a>
															</div>
															<div class="clearfix">
																<h4 class="block">Navigation Block Large Icons</h4>
																<button class="btn btn-circle blue btn-block btn-lg m-icon-big">Button <i class="m-icon-big-swapright m-icon-white"></i></button>
																<a href="#" class="btn btn-circle green btn-block btn-lg m-icon-big">
																Link <i class="m-icon-big-swapright m-icon-white"></i>
																</a>
															</div>
															<div class="clearfix">
																<h4 class="block">Navigation Defualt Icons Buttons</h4>
																<a href="#" class="btn btn-circle default m-icon">
																Submit <i class="m-icon-swapleft"></i>
																</a>
																<a href="#" class="btn btn-circle green m-icon">
																Submit <i class="m-icon-swapright m-icon-white"></i>
																</a>
																<a href="#" class="btn btn-circle blue m-icon">
																Submit <i class="m-icon-swapdown m-icon-white"></i>
																</a>
																<a href="#" class="btn btn-circle dark m-icon">
																Submit <i class="m-icon-swapup m-icon-white"></i>
																</a>
															</div>
															<div class="clearfix">
																<h4 class="block">Navigation Defualt Icons Only Buttons</h4>
																<a href="#" class="btn btn-circle default m-icon m-icon-only">
																<i class="m-icon-swapleft"></i>
																</a>
																<a href="#" class="btn btn-circle green m-icon m-icon-only">
																<i class="m-icon-swapright m-icon-white"></i>
																</a>
																<a href="#" class="btn btn-circle blue m-icon m-icon-only">
																<i class="m-icon-swapdown m-icon-white"></i>
																</a>
																<a href="#" class="btn btn-circle dark m-icon m-icon-only">
																<i class="m-icon-swapup m-icon-white"></i>
																</a>
															</div>
															<div class="clearfix">
																<h4 class="block">Navigation Block Defualt Icons</h4>
																<button class="btn btn-circle blue btn-block m-icon">Button <i class="m-icon-swapright m-icon-white"></i></button>
																<a href="#" class="btn btn-circle green btn-block m-icon">
																Link <i class="m-icon-swapright m-icon-white"></i>
																</a>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
										<!-- END BUTTONS WITH ICONS PORTLET-->
										<div class="portlet box blue">
											<div class="portlet-title">
												<div class="caption">
													<i class="fa fa-gift"></i>Font Awesome Styled Buttons
												</div>
												<div class="tools">
													<a href="javascript:;" class="collapse">
													</a>
													<a href="#portlet-config" data-toggle="modal" class="config">
													</a>
													<a href="javascript:;" class="reload">
													</a>
													<a href="javascript:;" class="remove">
													</a>
												</div>
											</div>
											<div class="portlet-body">
												<a href="#" class="icon-btn">
												<i class="fa fa-group"></i>
												<div>
													 Users
												</div>
												<span class="badge badge-danger">
												2 </span>
												</a>
												<a href="#" class="icon-btn">
												<i class="fa fa-barcode"></i>
												<div>
													 Products
												</div>
												<span class="badge badge-success">
												4 </span>
												</a>
												<a href="#" class="icon-btn">
												<i class="fa fa-bar-chart-o"></i>
												<div>
													 Reports
												</div>
												</a>
												<a href="#" class="icon-btn">
												<i class="fa fa-sitemap"></i>
												<div>
													 Categories
												</div>
												</a>
												<a href="#" class="icon-btn">
												<i class="fa fa-calendar"></i>
												<div>
													 Calendar
												</div>
												<span class="badge badge-success">
												4 </span>
												</a>
												<a href="#" class="icon-btn">
												<i class="fa fa-envelope"></i>
												<div>
													 Inbox
												</div>
												<span class="badge badge-info">
												12 </span>
												</a>
												<a href="#" class="icon-btn">
												<i class="fa fa-bullhorn"></i>
												<div>
													 Notification
												</div>
												<span class="badge badge-danger">
												3 </span>
												</a>
												<a href="#" class="icon-btn">
												<i class="fa fa-map-marker"></i>
												<div>
													 Locations
												</div>
												</a>
												<a href="#" class="icon-btn">
												<i class="fa fa-money"><i></i></i>
												<div>
													 Finance
												</div>
												</a>
												<a href="#" class="icon-btn">
												<i class="fa fa-plane"></i>
												<div>
													 Projects
												</div>
												<span class="badge badge-info">
												21 </span>
												</a>
												<a href="#" class="icon-btn">
												<i class="fa fa-thumbs-up"></i>
												<div>
													 Feedback
												</div>
												<span class="badge badge-info">
												2 </span>
												</a>
												<a href="#" class="icon-btn">
												<i class="fa fa-cloud"></i>
												<div>
													 Servers
												</div>
												<span class="badge badge-danger">
												2 </span>
												</a>
												<a href="#" class="icon-btn">
												<i class="fa fa-globe"></i>
												<div>
													 Regions
												</div>
												</a>
												<a href="#" class="icon-btn">
												<i class="fa fa-heart-o"></i>
												<div>
													 Popularity
												</div>
												<span class="badge badge-info">
												221 </span>
												</a>
											</div>
										</div>
										<!-- BEGIN BLOCK BUTTONS PORTLET-->
										<div class="portlet box purple">
											<div class="portlet-title">
												<div class="caption">
													<i class="fa fa-gift"></i>List Social Icons(UL)
												</div>
												<div class="tools">
													<a href="javascript:;" class="collapse">
													</a>
													<a href="#portlet-config" data-toggle="modal" class="config">
													</a>
													<a href="javascript:;" class="reload">
													</a>
													<a href="javascript:;" class="remove">
													</a>
												</div>
											</div>
											<div class="portlet-body util-btn-margin-bottom-5">
												<ul class="social-icons social-icons-circle">
													<li>
														<a href="#" data-original-title="amazon" class="amazon">
														</a>
													</li>
													<li>
														<a href="#" data-original-title="behance" class="behance">
														</a>
													</li>
													<li>
														<a href="#" data-original-title="blogger" class="blogger">
														</a>
													</li>
													<li>
														<a href="#" data-original-title="deviantart" class="deviantart">
														</a>
													</li>
													<li>
														<a href="#" data-original-title="dribbble" class="dribbble">
														</a>
													</li>
													<li>
														<a href="#" data-original-title="dropbox" class="dropbox">
														</a>
													</li>
													<li>
														<a href="#" data-original-title="facebook" class="facebook">
														</a>
													</li>
													<li>
														<a href="#" data-original-title="forrst" class="forrst">
														</a>
													</li>
													<li>
														<a href="#" data-original-title="github" class="github">
														</a>
													</li>
													<li>
														<a href="#" data-original-title="Goole Plus" class="googleplus">
														</a>
													</li>
													<li>
														<a href="#" data-original-title="jolicloud" class="jolicloud">
														</a>
													</li>
													<li>
														<a href="#" data-original-title="last-fm" class="last-fm">
														</a>
													</li>
													<li>
														<a href="#" data-original-title="linkedin" class="linkedin">
														</a>
													</li>
													<li>
														<a href="#" data-original-title="picasa" class="picasa">
														</a>
													</li>
													<li>
														<a href="#" data-original-title="pintrest" class="pintrest">
														</a>
													</li>
													<li>
														<a href="#" data-original-title="rss" class="rss">
														</a>
													</li>
													<li>
														<a href="#" data-original-title="skype" class="skype">
														</a>
													</li>
													<li>
														<a href="#" data-original-title="spotify" class="spotify">
														</a>
													</li>
													<li>
														<a href="#" data-original-title="stumbleupon" class="stumbleupon">
														</a>
													</li>
													<li>
														<a href="#" data-original-title="tumblr" class="tumblr">
														</a>
													</li>
													<li>
														<a href="#" data-original-title="twitter" class="twitter">
														</a>
													</li>
													<li>
														<a href="#" data-original-title="vimeo" class="vimeo">
														</a>
													</li>
													<li>
														<a href="#" data-original-title="wordpress" class="wordpress">
														</a>
													</li>
													<li>
														<a href="#" data-original-title="xing" class="xing">
														</a>
													</li>
													<li>
														<a href="#" data-original-title="yahoo" class="yahoo">
														</a>
													</li>
													<li>
														<a href="#" data-original-title="youtube" class="youtube">
														</a>
													</li>
													<li>
														<a href="#" data-original-title="vk" class="vk">
														</a>
													</li>
													<li>
														<a href="#" data-original-title="instagram" class="instagram">
														</a>
													</li>
													<li>
														<a href="#" data-original-title="reddit" class="reddit">
														</a>
													</li>
													<li>
														<a href="#" data-original-title="aboutme" class="aboutme">
														</a>
													</li>
													<li>
														<a href="#" data-original-title="flickr" class="flickr">
														</a>
													</li>
													<li>
														<a href="#" data-original-title="foursquare" class="foursquare">
														</a>
													</li>
													<li>
														<a href="#" data-original-title="gravatar" class="gravatar">
														</a>
													</li>
													<li>
														<a href="#" data-original-title="klout" class="klout">
														</a>
													</li>
													<li>
														<a href="#" data-original-title="myspace" class="myspace">
														</a>
													</li>
													<li>
														<a href="#" data-original-title="quora" class="quora">
														</a>
													</li>
												</ul>
											</div>
										</div>
										<!-- END BLOCK BUTTONS PORTLET-->
										<!-- BEGIN BLOCK BUTTONS PORTLET-->
										<div class="portlet box purple">
											<div class="portlet-title">
												<div class="caption">
													<i class="fa fa-gift"></i>Inline Social Icons
												</div>
												<div class="tools">
													<a href="javascript:;" class="collapse">
													</a>
													<a href="#portlet-config" data-toggle="modal" class="config">
													</a>
													<a href="javascript:;" class="reload">
													</a>
													<a href="javascript:;" class="remove">
													</a>
												</div>
											</div>
											<div class="portlet-body util-btn-margin-bottom-5">
												<a href="#" data-original-title="amazon" class="social-icon social-icon-circle amazon">
												</a>
												<a href="#" data-original-title="behance" class="social-icon social-icon-circle behance">
												</a>
												<a href="#" data-original-title="blogger" class="social-icon social-icon-circle blogger">
												</a>
												<a href="#" data-original-title="deviantart" class="social-icon social-icon-circle deviantart">
												</a>
												<a href="#" data-original-title="dribbble" class="social-icon social-icon-circle dribbble">
												</a>
												<a href="#" data-original-title="dropbox" class="social-icon social-icon-circle dropbox">
												</a>
												<a href="#" data-original-title="facebook" class="social-icon social-icon-circle facebook">
												</a>
												<a href="#" data-original-title="forrst" class="social-icon social-icon-circle forrst">
												</a>
												<a href="#" data-original-title="github" class="social-icon social-icon-circle github">
												</a>
												<a href="#" data-original-title="Goole Plus" class="social-icon social-icon-circle googleplus">
												</a>
												<a href="#" data-original-title="jolicloud" class="social-icon social-icon-circle jolicloud">
												</a>
												<a href="#" data-original-title="last-fm" class="social-icon social-icon-circle last-fm">
												</a>
												<a href="#" data-original-title="linkedin" class="social-icon social-icon-circle linkedin">
												</a>
												<a href="#" data-original-title="picasa" class="social-icon social-icon-circle picasa">
												</a>
												<a href="#" data-original-title="pintrest" class="social-icon social-icon-circle pintrest">
												</a>
												<a href="#" data-original-title="rss" class="social-icon social-icon-circle rss">
												</a>
												<a href="#" data-original-title="skype" class="social-icon social-icon-circle skype">
												</a>
												<a href="#" data-original-title="spotify" class="social-icon social-icon-circle spotify">
												</a>
												<a href="#" data-original-title="stumbleupon" class="social-icon social-icon-circle stumbleupon">
												</a>
												<a href="#" data-original-title="tumblr" class="social-icon social-icon-circle tumblr">
												</a>
												<a href="#" data-original-title="twitter" class="social-icon social-icon-circle twitter">
												</a>
												<a href="#" data-original-title="vimeo" class="social-icon social-icon-circle vimeo">
												</a>
												<a href="#" data-original-title="wordpress" class="social-icon social-icon-circle wordpress">
												</a>
												<a href="#" data-original-title="xing" class="social-icon social-icon-circle xing">
												</a>
												<a href="#" data-original-title="yahoo" class="social-icon social-icon-circle yahoo">
												</a>
												<a href="#" data-original-title="youtube" class="social-icon social-icon-circle youtube">
												</a>
												<a href="#" data-original-title="vk" class="social-icon social-icon-circle vk">
												</a>
												<a href="#" data-original-title="instagram" class="social-icon social-icon-circle instagram">
												</a>
												<a href="#" data-original-title="reddit" class="social-icon social-icon-circle social-icon-circle reddit">
												</a>
												<a href="#" data-original-title="aboutme" class="social-icon social-icon-circle aboutme">
												</a>
												<a href="#" data-original-title="flickr" class="social-icon social-icon-circle flickr">
												</a>
												<a href="#" data-original-title="foursquare" class="social-icon social-icon-circle foursquare">
												</a>
												<a href="#" data-original-title="gravatar" class="social-icon social-icon-circle gravatar">
												</a>
												<a href="#" data-original-title="klout" class="social-icon social-icon-circle klout">
												</a>
												<a href="#" data-original-title="myspace" class="social-icon social-icon-circle myspace">
												</a>
												<a href="#" data-original-title="quora" class="social-icon social-icon-circle quora">
												</a>
											</div>
										</div>
										<!-- END BLOCK BUTTONS PORTLET-->
										<!-- BEGIN BLOCK BUTTONS PORTLET-->
										<div class="portlet box blue">
											<div class="portlet-title">
												<div class="caption">
													<i class="fa fa-gift"></i>Social Icons(Colored)
												</div>
												<div class="tools">
													<a href="javascript:;" class="collapse">
													</a>
													<a href="#portlet-config" data-toggle="modal" class="config">
													</a>
													<a href="javascript:;" class="reload">
													</a>
													<a href="javascript:;" class="remove">
													</a>
												</div>
											</div>
											<div class="portlet-body">
												<ul class="social-icons social-icons-color social-icons-circle">
													<li>
														<a href="#" data-original-title="amazon" class="amazon">
														</a>
													</li>
													<li>
														<a href="#" data-original-title="behance" class="behance">
														</a>
													</li>
													<li>
														<a href="#" data-original-title="blogger" class="blogger">
														</a>
													</li>
													<li>
														<a href="#" data-original-title="deviantart" class="deviantart">
														</a>
													</li>
													<li>
														<a href="#" data-original-title="dribbble" class="dribbble">
														</a>
													</li>
													<li>
														<a href="#" data-original-title="dropbox" class="dropbox">
														</a>
													</li>
													<li>
														<a href="#" data-original-title="facebook" class="facebook">
														</a>
													</li>
													<li>
														<a href="#" data-original-title="forrst" class="forrst">
														</a>
													</li>
													<li>
														<a href="#" data-original-title="github" class="github">
														</a>
													</li>
													<li>
														<a href="#" data-original-title="Goole Plus" class="googleplus">
														</a>
													</li>
													<li>
														<a href="#" data-original-title="jolicloud" class="jolicloud">
														</a>
													</li>
													<li>
														<a href="#" data-original-title="last-fm" class="last-fm">
														</a>
													</li>
													<li>
														<a href="#" data-original-title="linkedin" class="linkedin">
														</a>
													</li>
													<li>
														<a href="#" data-original-title="picasa" class="picasa">
														</a>
													</li>
													<li>
														<a href="#" data-original-title="pintrest" class="pintrest">
														</a>
													</li>
													<li>
														<a href="#" data-original-title="rss" class="rss">
														</a>
													</li>
													<li>
														<a href="#" data-original-title="skype" class="skype">
														</a>
													</li>
													<li>
														<a href="#" data-original-title="spotify" class="spotify">
														</a>
													</li>
													<li>
														<a href="#" data-original-title="stumbleupon" class="stumbleupon">
														</a>
													</li>
													<li>
														<a href="#" data-original-title="tumblr" class="tumblr">
														</a>
													</li>
													<li>
														<a href="#" data-original-title="twitter" class="twitter">
														</a>
													</li>
													<li>
														<a href="#" data-original-title="vimeo" class="vimeo">
														</a>
													</li>
													<li>
														<a href="#" data-original-title="wordpress" class="wordpress">
														</a>
													</li>
													<li>
														<a href="#" data-original-title="xing" class="xing">
														</a>
													</li>
													<li>
														<a href="#" data-original-title="yahoo" class="yahoo">
														</a>
													</li>
													<li>
														<a href="#" data-original-title="youtube" class="youtube">
														</a>
													</li>
													<li>
														<a href="#" data-original-title="vk" class="vk">
														</a>
													</li>
													<li>
														<a href="#" data-original-title="instagram" class="instagram">
														</a>
													</li>
													<li>
														<a href="#" data-original-title="reddit" class="reddit">
														</a>
													</li>
													<li>
														<a href="#" data-original-title="aboutme" class="aboutme">
														</a>
													</li>
													<li>
														<a href="#" data-original-title="flickr" class="flickr">
														</a>
													</li>
													<li>
														<a href="#" data-original-title="foursquare" class="foursquare">
														</a>
													</li>
													<li>
														<a href="#" data-original-title="gravatar" class="gravatar">
														</a>
													</li>
													<li>
														<a href="#" data-original-title="klout" class="klout">
														</a>
													</li>
													<li>
														<a href="#" data-original-title="myspace" class="myspace">
														</a>
													</li>
													<li>
														<a href="#" data-original-title="quora" class="quora">
														</a>
													</li>
												</ul>
											</div>
										</div>
										<!-- END BLOCK BUTTONS PORTLET-->
										<!-- BEGIN BLOCK BUTTONS PORTLET-->
										<div class="portlet box purple">
											<div class="portlet-title">
												<div class="caption">
													<i class="fa fa-gift"></i>Inline Social Icons(Colored)
												</div>
												<div class="tools">
													<a href="javascript:;" class="collapse">
													</a>
													<a href="#portlet-config" data-toggle="modal" class="config">
													</a>
													<a href="javascript:;" class="reload">
													</a>
													<a href="javascript:;" class="remove">
													</a>
												</div>
											</div>
											<div class="portlet-body util-btn-margin-bottom-5">
												<a href="#" data-original-title="amazon" class="social-icon social-icon-circle social-icon-color amazon">
												</a>
												<a href="#" data-original-title="behance" class="social-icon social-icon-circle social-icon-color behance">
												</a>
												<a href="#" data-original-title="blogger" class="social-icon social-icon-circle social-icon-color blogger">
												</a>
												<a href="#" data-original-title="deviantart" class="social-icon social-icon-circle social-icon-color deviantart">
												</a>
												<a href="#" data-original-title="dribbble" class="social-icon social-icon-circle social-icon-color dribbble">
												</a>
												<a href="#" data-original-title="dropbox" class="social-icon social-icon-circle social-icon-color dropbox">
												</a>
												<a href="#" data-original-title="facebook" class="social-icon social-icon-circle social-icon-color facebook">
												</a>
												<a href="#" data-original-title="forrst" class="social-icon social-icon-circle social-icon-color forrst">
												</a>
												<a href="#" data-original-title="github" class="social-icon social-icon-circle social-icon-color github">
												</a>
												<a href="#" data-original-title="Goole Plus" class="social-icon social-icon-circle social-icon-color googleplus">
												</a>
												<a href="#" data-original-title="jolicloud" class="social-icon social-icon-circle social-icon-color jolicloud">
												</a>
												<a href="#" data-original-title="last-fm" class="social-icon social-icon-circle social-icon-color last-fm">
												</a>
												<a href="#" data-original-title="linkedin" class="social-icon social-icon-circle social-icon-color linkedin">
												</a>
												<a href="#" data-original-title="picasa" class="social-icon social-icon-circle social-icon-color picasa">
												</a>
												<a href="#" data-original-title="pintrest" class="social-icon social-icon-circle social-icon-color pintrest">
												</a>
												<a href="#" data-original-title="rss" class="social-icon social-icon-circle social-icon-color rss">
												</a>
												<a href="#" data-original-title="skype" class="social-icon social-icon-circle social-icon-color skype">
												</a>
												<a href="#" data-original-title="spotify" class="social-icon social-icon-circle social-icon-color spotify">
												</a>
												<a href="#" data-original-title="stumbleupon" class="social-icon social-icon-circle social-icon-color stumbleupon">
												</a>
												<a href="#" data-original-title="tumblr" class="social-icon social-icon-circle social-icon-color tumblr">
												</a>
												<a href="#" data-original-title="twitter" class="social-icon social-icon-circle social-icon-color twitter">
												</a>
												<a href="#" data-original-title="vimeo" class="social-icon social-icon-circle social-icon-color vimeo">
												</a>
												<a href="#" data-original-title="wordpress" class="social-icon social-icon-circle social-icon-color wordpress">
												</a>
												<a href="#" data-original-title="xing" class="social-icon social-icon-circle social-icon-color xing">
												</a>
												<a href="#" data-original-title="yahoo" class="social-icon social-icon-circle social-icon-color yahoo">
												</a>
												<a href="#" data-original-title="youtube" class="social-icon social-icon-circle social-icon-color youtube">
												</a>
												<a href="#" data-original-title="vk" class="social-icon social-icon-circle social-icon-color vk">
												</a>
												<a href="#" data-original-title="instagram" class="social-icon social-icon-circle social-icon-color instagram">
												</a>
												<a href="#" data-original-title="reddit" class="social-icon social-icon-circle social-icon-color reddit">
												</a>
												<a href="#" data-original-title="aboutme" class="social-icon social-icon-circle social-icon-color aboutme">
												</a>
												<a href="#" data-original-title="flickr" class="social-icon social-icon-circle social-icon-color flickr">
												</a>
												<a href="#" data-original-title="foursquare" class="social-icon social-icon-circle social-icon-color foursquare">
												</a>
												<a href="#" data-original-title="gravatar" class="social-icon social-icon-circle social-icon-color gravatar">
												</a>
												<a href="#" data-original-title="klout" class="social-icon social-icon-circle social-icon-color klout">
												</a>
												<a href="#" data-original-title="myspace" class="social-icon social-icon-circle social-icon-color myspace">
												</a>
												<a href="#" data-original-title="quora" class="social-icon social-icon-circle social-icon-color quora">
												</a>
											</div>
										</div>
										<!-- END BLOCK BUTTONS PORTLET-->
									</div>
									<div class="col-md-6">
										<!-- BEGIN BLOCK BUTTONS PORTLET-->
										<div class="portlet box yellow">
											<div class="portlet-title">
												<div class="caption">
													<i class="fa fa-gift"></i>Button Groups
												</div>
												<div class="tools">
													<a href="javascript:;" class="collapse">
													</a>
													<a href="#portlet-config" data-toggle="modal" class="config">
													</a>
													<a href="javascript:;" class="reload">
													</a>
													<a href="javascript:;" class="remove">
													</a>
												</div>
											</div>
											<div class="portlet-body">
												<div class="clearfix">
													<h4 class="block">Basic Example</h4>
													<div class="btn-group btn-group-circle">
														<button type="button" class="btn btn-default">Left</button>
														<button type="button" class="btn btn-default">Middle</button>
														<button type="button" class="btn btn-default">Right</button>
													</div>
													<div class="btn-group btn-group-circle btn-group-solid">
														<button type="button" class="btn red">Left</button>
														<button type="button" class="btn yellow">Middle</button>
														<button type="button" class="btn green">Right</button>
													</div>
												</div>
												<div class="clearfix">
													<h4 class="block">Devided Button Groups</h4>
													<div class="btn-group btn-group-devided">
														<button type="button" class="btn btn-circle btn-default">Left</button>
														<button type="button" class="btn btn-circle btn-default">Middle</button>
														<button type="button" class="btn btn-circle btn-default">Right</button>
													</div>
													<div class="btn-group btn-group-devided btn-group-solid">
														<button type="button" class="btn btn-circle red">Left</button>
														<button type="button" class="btn btn-circle yellow">Middle</button>
														<button type="button" class="btn btn-circle green">Right</button>
													</div>
												</div>
												<div class="clearfix">
													<h4 class="block">Button Toolbar</h4>
													<div class="btn-toolbar margin-bottom-10">
														<div class="btn-group btn-group-circle">
															<button type="button" class="btn btn-default">1</button>
															<button type="button" class="btn btn-default">2</button>
															<button type="button" class="btn btn-default">3</button>
															<button type="button" class="btn btn-default">4</button>
														</div>
														<div class="btn-group btn-group-circle">
															<button type="button" class="btn btn-default">5</button>
															<button type="button" class="btn btn-default">6</button>
															<button type="button" class="btn btn-default">7</button>
														</div>
														<div class="btn-group">
															<button type="button" class="btn btn-circle btn-default">8</button>
														</div>
													</div>
													<div class="btn-toolbar">
														<div class="btn-group btn-group-circle btn-group-solid">
															<button type="button" class="btn red">1</button>
															<button type="button" class="btn green">2</button>
															<button type="button" class="btn blue">3</button>
															<button type="button" class="btn yellow">4</button>
														</div>
														<div class="btn-group btn-group-circle btn-group-solid">
															<button type="button" class="btn purple">5</button>
															<button type="button" class="btn dark">6</button>
															<button type="button" class="btn default">7</button>
														</div>
														<div class="btn-group btn-group-solid">
															<button type="button" class="btn btn-circle red">8</button>
														</div>
													</div>
												</div>
												<div class="clearfix">
													<h4 class="block">Button Group Sizing</h4>
													<div class="btn-toolbar">
														<div class="btn-group btn-group-circle btn-group-lg btn-group-solid margin-bottom-10">
															<button type="button" class="btn red">Left</button>
															<button type="button" class="btn green">Middle</button>
															<button type="button" class="btn blue">Right</button>
														</div>
													</div>
													<div class="btn-toolbar margin-bottom-10">
														<div class="btn-group btn-group-circle btn-group-solid">
															<button type="button" class="btn red">Left</button>
															<button type="button" class="btn green">Middle</button>
															<button type="button" class="btn blue">Right</button>
														</div>
													</div>
													<div class="btn-toolbar margin-bottom-10">
														<div class="btn-group btn-group-circle btn-group-sm btn-group-solid">
															<button type="button" class="btn red">Left</button>
															<button type="button" class="btn green">Middle</button>
															<button type="button" class="btn blue">Right</button>
														</div>
													</div>
													<div class="btn-toolbar margin-bottom-10">
														<div class="btn-group btn-group-circle btn-group-xs btn-group-solid">
															<button type="button" class="btn red">Left</button>
															<button type="button" class="btn green">Middle</button>
															<button type="button" class="btn blue">Right</button>
														</div>
													</div>
												</div>
												<div class="clearfix">
													<h4 class="block">Nesting Button Group</h4>
													<div class="btn-group btn-group-circle">
														<button type="button" class="btn btn-default"><i class="fa fa-user"></i> Profile</button>
														<button type="button" class="btn btn-default"><i class="fa fa-cogs"></i> Settings</button>
														<button type="button" class="btn btn-default"><i class="fa fa-bullhorn"></i> Feeds</button>
														<div class="btn-group">
															<button type="button" class="btn btn-default btn-circle-right dropdown-toggle" data-toggle="dropdown">
															<i class="fa fa-ellipsis-horizontal"></i> More <i class="fa fa-angle-down"></i>
															</button>
															<ul class="dropdown-menu">
																<li>
																	<a href="#">
																	Dropdown link </a>
																</li>
																<li>
																	<a href="#">
																	Dropdown link </a>
																</li>
															</ul>
														</div>
													</div>
													<div class="clearfix margin-bottom-10">
													</div>
													<div class="btn-group btn-group-circle btn-group-solid">
														<button type="button" class="btn red"><i class="fa fa-user"></i> Profile</button>
														<button type="button" class="btn green"><i class="fa fa-cogs"></i> Settings</button>
														<button type="button" class="btn purple"><i class="fa fa-bullhorn"></i> Feeds</button>
														<div class="btn-group btn-group-solid">
															<button type="button" class="btn btn-circle-right blue dropdown-toggle" data-toggle="dropdown">
															<i class="fa fa-ellipsis-horizontal"></i> More <i class="fa fa-angle-down"></i>
															</button>
															<ul class="dropdown-menu">
																<li>
																	<a href="#">
																	Dropdown link </a>
																</li>
																<li>
																	<a href="#">
																	Dropdown link </a>
																</li>
															</ul>
														</div>
													</div>
												</div>
												<div class="clearfix">
													<h4 class="block">Vertical variation</h4>
													<div class="btn-group-vertical btn-group-vertical-circle margin-right-10">
														<button type="button" class="btn btn-default">Button</button>
														<button type="button" class="btn btn-default">Button</button>
														<div class="btn-group">
															<button id="btn btn-circleGroupVerticalDrop1" type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
															Dropdown <i class="fa fa-angle-down"></i>
															</button>
															<ul class="dropdown-menu" role="menu" aria-labelledby="btn btn-circleGroupVerticalDrop1">
																<li>
																	<a href="#">
																	Dropdown link </a>
																</li>
																<li>
																	<a href="#">
																	Dropdown link </a>
																</li>
															</ul>
														</div>
														<button type="button" class="btn btn-default">Button</button>
														<button type="button" class="btn btn-default">Button</button>
														<div class="btn-group">
															<button id="btn btn-circleGroupVerticalDrop2" type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
															Dropdown <i class="fa fa-angle-down"></i>
															</button>
															<ul class="dropdown-menu" role="menu" aria-labelledby="btn btn-circleGroupVerticalDrop2">
																<li>
																	<a href="#">
																	Dropdown link </a>
																</li>
																<li>
																	<a href="#">
																	Dropdown link </a>
																</li>
															</ul>
														</div>
														<div class="btn-group">
															<button id="btn btn-circleGroupVerticalDrop3" type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
															Dropdown <i class="fa fa-angle-down"></i>
															</button>
															<ul class="dropdown-menu" role="menu" aria-labelledby="btn btn-circleGroupVerticalDrop3">
																<li>
																	<a href="#">
																	Dropdown link </a>
																</li>
																<li>
																	<a href="#">
																	Dropdown link </a>
																</li>
															</ul>
														</div>
														<div class="btn-group">
															<button id="btn btn-circleGroupVerticalDrop4" type="button" class="btn btn-circle-bottom btn-default dropdown-toggle" data-toggle="dropdown">
															Dropdown <i class="fa fa-angle-down"></i>
															</button>
															<ul class="dropdown-menu" role="menu" aria-labelledby="btn btn-circleGroupVerticalDrop4">
																<li>
																	<a href="#">
																	Dropdown link </a>
																</li>
																<li>
																	<a href="#">
																	Dropdown link </a>
																</li>
															</ul>
														</div>
													</div>
													<div class="btn-group-vertical btn-group-vertical-circle btn-group-solid">
														<button type="button" class="btn blue">Button</button>
														<button type="button" class="btn green">Button</button>
														<div class="btn-group">
															<button id="btn btn-circleGroupVerticalDrop5" type="button" class="btn yellow dropdown-toggle" data-toggle="dropdown">
															Dropdown <i class="fa fa-angle-down"></i>
															</button>
															<ul class="dropdown-menu" role="menu" aria-labelledby="btn btn-circleGroupVerticalDrop5">
																<li>
																	<a href="#">
																	Dropdown link </a>
																</li>
																<li>
																	<a href="#">
																	Dropdown link </a>
																</li>
															</ul>
														</div>
														<button type="button" class="btn red">Button</button>
														<button type="button" class="btn dark">Button</button>
														<div class="btn-group">
															<button id="btn btn-circleGroupVerticalDrop6" type="button" class="btn default dropdown-toggle" data-toggle="dropdown">
															Dropdown <i class="fa fa-angle-down"></i>
															</button>
															<ul class="dropdown-menu" role="menu" aria-labelledby="btn btn-circleGroupVerticalDrop6">
																<li>
																	<a href="#">
																	Dropdown link </a>
																</li>
																<li>
																	<a href="#">
																	Dropdown link </a>
																</li>
															</ul>
														</div>
														<div class="btn-group">
															<button id="btn btn-circleGroupVerticalDrop7" type="button" class="btn purple dropdown-toggle" data-toggle="dropdown">
															Dropdown <i class="fa fa-angle-down"></i>
															</button>
															<ul class="dropdown-menu" role="menu" aria-labelledby="btn btn-circleGroupVerticalDrop7">
																<li>
																	<a href="#">
																	Dropdown link </a>
																</li>
																<li>
																	<a href="#">
																	Dropdown link </a>
																</li>
															</ul>
														</div>
														<div class="btn-group">
															<button id="btn btn-circleGroupVerticalDrop8" type="button" class="btn btn-circle-bottom yellow dropdown-toggle" data-toggle="dropdown">
															Dropdown <i class="fa fa-angle-down"></i>
															</button>
															<ul class="dropdown-menu" role="menu" aria-labelledby="btn btn-circleGroupVerticalDrop8">
																<li>
																	<a href="#">
																	Dropdown link </a>
																</li>
																<li>
																	<a href="#">
																	Dropdown link </a>
																</li>
															</ul>
														</div>
													</div>
												</div>
												<div class="clearfix">
													<h4 class="block">Justified Link Variation</h4>
													<div class="btn-group btn-group-circle btn-group-justified">
														<a href="#" class="btn btn-default">
														Left </a>
														<a href="#" class="btn btn-default">
														Middle </a>
														<a href="#" class="btn btn-default">
														Right </a>
													</div>
													<div class="clearfix margin-bottom-10">
													</div>
													<div class="btn-group btn-group-circle btn-group-justified">
														<a href="#" class="btn red">
														Left </a>
														<a href="#" class="btn blue">
														Middle </a>
														<a href="#" class="btn green">
														Right </a>
													</div>
												</div>
											</div>
										</div>
										<!-- END BLOCK BUTTONS PORTLET-->
										<!-- BEGIN DROPDOWNS PORTLET-->
										<div class="portlet box green">
											<div class="portlet-title">
												<div class="caption">
													<i class="fa fa-gift"></i> Button Dropdowns
												</div>
											</div>
											<div class="portlet-body util-btn-group-margin-bottom-5">
												<div class="clearfix">
													<h4 class="block">Default Bootstrap Style</h4>
													<div class="btn-group btn-group-circle">
														<button type="button" class="btn btn-default">Default</button>
														<button type="button" class="btn btn-circle-right btn-default dropdown-toggle1" data-toggle="dropdown">
														<i class="fa fa-angle-down"></i></button>
														<ul class="dropdown-menu" role="menu">
															<li>
																<a href="#">
																Action </a>
															</li>
															<li>
																<a href="#">
																Another action </a>
															</li>
															<li>
																<a href="#">
																Something else here </a>
															</li>
															<li class="divider">
															</li>
															<li>
																<a href="#">
																Separated link </a>
															</li>
														</ul>
													</div>
													<!-- /btn-group -->
													<div class="btn-group btn-group-circle">
														<button type="button" class="btn btn-primary">Primary</button>
														<button type="button" class="btn btn-circle-right btn-primary dropdown-toggle" data-toggle="dropdown"><i class="fa fa-angle-down"></i></button>
														<ul class="dropdown-menu" role="menu">
															<li>
																<a href="#">
																Action </a>
															</li>
															<li>
																<a href="#">
																Another action </a>
															</li>
															<li>
																<a href="#">
																Something else here </a>
															</li>
															<li class="divider">
															</li>
															<li>
																<a href="#">
																Separated link </a>
															</li>
														</ul>
													</div>
													<!-- /btn-group -->
													<div class="btn-group btn-group-circle">
														<button type="button" class="btn btn-success">Success</button>
														<button type="button" class="btn btn-circle-right btn-success dropdown-toggle" data-toggle="dropdown"><i class="fa fa-angle-down"></i></button>
														<ul class="dropdown-menu" role="menu">
															<li>
																<a href="#">
																Action </a>
															</li>
															<li>
																<a href="#">
																Another action </a>
															</li>
															<li>
																<a href="#">
																Something else here </a>
															</li>
															<li class="divider">
															</li>
															<li>
																<a href="#">
																Separated link </a>
															</li>
														</ul>
													</div>
													<!-- /btn-group -->
													<div class="btn-group btn-group-circle">
														<button type="button" class="btn btn-info">Info</button>
														<button type="button" class="btn btn-circle-right btn-info dropdown-toggle" data-toggle="dropdown"><i class="fa fa-angle-down"></i></button>
														<ul class="dropdown-menu" role="menu">
															<li>
																<a href="#">
																Action </a>
															</li>
															<li>
																<a href="#">
																Another action </a>
															</li>
															<li>
																<a href="#">
																Something else here </a>
															</li>
															<li class="divider">
															</li>
															<li>
																<a href="#">
																Separated link </a>
															</li>
														</ul>
													</div>
													<!-- /btn-group -->
													<div class="btn-group btn-group-circle">
														<button type="button" class="btn btn-warning">Warning</button>
														<button type="button" class="btn btn-circle-right btn-warning dropdown-toggle" data-toggle="dropdown"><i class="fa fa-angle-down"></i></button>
														<ul class="dropdown-menu" role="menu">
															<li>
																<a href="#">
																Action </a>
															</li>
															<li>
																<a href="#">
																Another action </a>
															</li>
															<li>
																<a href="#">
																Something else here </a>
															</li>
															<li class="divider">
															</li>
															<li>
																<a href="#">
																Separated link </a>
															</li>
														</ul>
													</div>
													<!-- /btn-group -->
													<div class="btn-group btn-group-circle">
														<button type="button" class="btn btn-danger">Danger</button>
														<button type="button" class="btn btn-circle-right btn-danger dropdown-toggle" data-toggle="dropdown"><i class="fa fa-angle-down"></i></button>
														<ul class="dropdown-menu" role="menu">
															<li>
																<a href="#">
																Action </a>
															</li>
															<li>
																<a href="#">
																Another action </a>
															</li>
															<li>
																<a href="#">
																Something else here </a>
															</li>
															<li class="divider">
															</li>
															<li>
																<a href="#">
																Separated link </a>
															</li>
														</ul>
													</div>
													<!-- /btn-group -->
												</div>
												<div class="clearfix">
													<h4 class="block">Metronic Style</h4>
													<div class="btn-group btn-group-circle">
														<button type="button" class="btn default">Default</button>
														<button type="button" class="btn btn-circle-right default dropdown-toggle" data-toggle="dropdown"><i class="fa fa-angle-down"></i></button>
														<ul class="dropdown-menu" role="menu">
															<li>
																<a href="#">
																Action </a>
															</li>
															<li>
																<a href="#">
																Another action </a>
															</li>
															<li>
																<a href="#">
																Something else here </a>
															</li>
															<li class="divider">
															</li>
															<li>
																<a href="#">
																Separated link </a>
															</li>
														</ul>
													</div>
													<!-- /btn-group -->
													<div class="btn-group btn-group-circle">
														<button type="button" class="btn blue">Blue</button>
														<button type="button" class="btn btn-circle-right blue dropdown-toggle" data-toggle="dropdown"><i class="fa fa-angle-down"></i></button>
														<ul class="dropdown-menu" role="menu">
															<li>
																<a href="#">
																Action </a>
															</li>
															<li>
																<a href="#">
																Another action </a>
															</li>
															<li>
																<a href="#">
																Something else here </a>
															</li>
															<li class="divider">
															</li>
															<li>
																<a href="#">
																Separated link </a>
															</li>
														</ul>
													</div>
													<!-- /btn-group -->
													<div class="btn-group btn-group-circle">
														<button type="button" class="btn green">Green</button>
														<button type="button" class="btn btn-circle-right green dropdown-toggle" data-toggle="dropdown"><i class="fa fa-angle-down"></i></button>
														<ul class="dropdown-menu" role="menu">
															<li>
																<a href="#">
																Action </a>
															</li>
															<li>
																<a href="#">
																Another action </a>
															</li>
															<li>
																<a href="#">
																Something else here </a>
															</li>
															<li class="divider">
															</li>
															<li>
																<a href="#">
																Separated link </a>
															</li>
														</ul>
													</div>
													<!-- /btn-group -->
													<div class="btn-group btn-group-circle">
														<button type="button" class="btn red">Red</button>
														<button type="button" class="btn btn-circle-right red dropdown-toggle" data-toggle="dropdown"><i class="fa fa-angle-down"></i></button>
														<ul class="dropdown-menu" role="menu">
															<li>
																<a href="#">
																Action </a>
															</li>
															<li>
																<a href="#">
																Another action </a>
															</li>
															<li>
																<a href="#">
																Something else here </a>
															</li>
															<li class="divider">
															</li>
															<li>
																<a href="#">
																Separated link </a>
															</li>
														</ul>
													</div>
													<!-- /btn-group -->
													<div class="btn-group btn-group-circle">
														<button type="button" class="btn yellow">Yellow</button>
														<button type="button" class="btn btn-circle-right yellow dropdown-toggle" data-toggle="dropdown"><i class="fa fa-angle-down"></i></button>
														<ul class="dropdown-menu" role="menu">
															<li>
																<a href="#">
																Action </a>
															</li>
															<li>
																<a href="#">
																Another action </a>
															</li>
															<li>
																<a href="#">
																Something else here </a>
															</li>
															<li class="divider">
															</li>
															<li>
																<a href="#">
																Separated link </a>
															</li>
														</ul>
													</div>
													<!-- /btn-group -->
													<div class="btn-group btn-group-circle">
														<button type="button" class="btn dark">Dark</button>
														<button type="button" class="btn btn-circle-right dark dropdown-toggle" data-toggle="dropdown"><i class="fa fa-angle-down"></i></button>
														<ul class="dropdown-menu" role="menu">
															<li>
																<a href="#">
																Action </a>
															</li>
															<li>
																<a href="#">
																Another action </a>
															</li>
															<li>
																<a href="#">
																Something else here </a>
															</li>
															<li class="divider">
															</li>
															<li>
																<a href="#">
																Separated link </a>
															</li>
														</ul>
													</div>
													<!-- /btn-group -->
													<div class="btn-group btn-group-circle">
														<button type="button" class="btn purple">Purple</button>
														<button type="button" class="btn btn-circle-right purple dropdown-toggle" data-toggle="dropdown"><i class="fa fa-angle-down"></i></button>
														<ul class="dropdown-menu" role="menu">
															<li>
																<a href="#">
																Action </a>
															</li>
															<li>
																<a href="#">
																Another action </a>
															</li>
															<li>
																<a href="#">
																Something else here </a>
															</li>
															<li class="divider">
															</li>
															<li>
																<a href="#">
																Separated link </a>
															</li>
														</ul>
													</div>
													<!-- /btn-group -->
												</div>
												<div class="clearfix">
													<h4 class="block">Dropdowns with Multilevel Submenu</h4>
													<!-- Large button group -->
													<div class="btn-group">
														<button class="btn btn-circle blue dropdown-toggle" type="button" data-toggle="dropdown">
														Dropdown <i class="fa fa-angle-down"></i>
														</button>
														<ul class="dropdown-menu" role="menu">
															<li>
																<a href="#">
																Action </a>
															</li>
															<li>
																<a href="#">
																Another action </a>
															</li>
															<li>
																<a href="#">
																Something else here </a>
															</li>
															<li class="divider">
															</li>
															<li class="dropdown-submenu">
																<a href="javascript:;">
																More options </a>
																<ul class="dropdown-menu" style="">
																	<li>
																		<a href="#">
																		Second level link </a>
																	</li>
																	<li class="dropdown-submenu">
																		<a href="javascript:;">
																		More options </a>
																		<ul class="dropdown-menu">
																			<li>
																				<a href="index.html">
																				Third level link </a>
																			</li>
																			<li>
																				<a href="index.html">
																				Third level link </a>
																			</li>
																			<li>
																				<a href="index.html">
																				Third level link </a>
																			</li>
																			<li>
																				<a href="index.html">
																				Third level link </a>
																			</li>
																			<li>
																				<a href="index.html">
																				Third level link </a>
																			</li>
																		</ul>
																	</li>
																	<li>
																		<a href="index.html">
																		Second level link </a>
																	</li>
																	<li>
																		<a href="index.html">
																		Second level link </a>
																	</li>
																	<li>
																		<a href="index.html">
																		Second level link </a>
																	</li>
																</ul>
															</li>
														</ul>
													</div>
													<div class="btn-group dropup">
														<button class="btn btn-circle green dropdown-toggle" type="button" data-toggle="dropdown">
														Dropup <i class="fa fa-angle-up"></i>
														</button>
														<ul class="dropdown-menu pull-right" role="menu">
															<li>
																<a href="#">
																Action </a>
															</li>
															<li>
																<a href="#">
																Another action </a>
															</li>
															<li>
																<a href="#">
																Something else here </a>
															</li>
															<li class="divider">
															</li>
															<li class="dropdown-submenu">
																<a href="javascript:;">
																More options </a>
																<ul class="dropdown-menu" style="">
																	<li>
																		<a href="#">
																		Second level link </a>
																	</li>
																	<li class="dropdown-submenu">
																		<a href="javascript:;">
																		More options </a>
																		<ul class="dropdown-menu pull-right">
																			<li>
																				<a href="index.html">
																				Third level link </a>
																			</li>
																			<li>
																				<a href="index.html">
																				Third level link </a>
																			</li>
																			<li>
																				<a href="index.html">
																				Third level link </a>
																			</li>
																			<li>
																				<a href="index.html">
																				Third level link </a>
																			</li>
																			<li>
																				<a href="index.html">
																				Third level link </a>
																			</li>
																		</ul>
																	</li>
																	<li>
																		<a href="index.html">
																		Second level link </a>
																	</li>
																	<li>
																		<a href="index.html">
																		Second level link </a>
																	</li>
																	<li>
																		<a href="index.html">
																		Second level link </a>
																	</li>
																</ul>
															</li>
														</ul>
													</div>
												</div>
												<div class="clearfix">
													<h4 class="block">Sizing</h4>
													<!-- Large button group -->
													<div class="btn-group">
														<button class="btn btn-circle btn-default btn-lg dropdown-toggle" type="button" data-toggle="dropdown">
														Large button <i class="fa fa-angle-down"></i>
														</button>
														<ul class="dropdown-menu" role="menu">
															<li>
																<a href="#">
																Action </a>
															</li>
															<li>
																<a href="#">
																Another action </a>
															</li>
															<li>
																<a href="#">
																Something else here </a>
															</li>
															<li class="divider">
															</li>
															<li>
																<a href="#">
																Separated link </a>
															</li>
														</ul>
													</div>
													<!-- Small button group -->
													<div class="btn-group">
														<button class="btn btn-circle btn-default btn-sm dropdown-toggle" type="button" data-toggle="dropdown">
														Small button <i class="fa fa-angle-down"></i>
														</button>
														<ul class="dropdown-menu" role="menu">
															<li>
																<a href="#">
																Action </a>
															</li>
															<li>
																<a href="#">
																Another action </a>
															</li>
															<li>
																<a href="#">
																Something else here </a>
															</li>
															<li class="divider">
															</li>
															<li>
																<a href="#">
																Separated link </a>
															</li>
														</ul>
													</div>
													<!-- Extra small button group -->
													<div class="btn-group">
														<button class="btn btn-circle btn-default btn-xs dropdown-toggle" type="button" data-toggle="dropdown">
														Extra small button <i class="fa fa-angle-down"></i>
														</button>
														<ul class="dropdown-menu" role="menu">
															<li>
																<a href="#">
																Action </a>
															</li>
															<li>
																<a href="#">
																Another action </a>
															</li>
															<li>
																<a href="#">
																Something else here </a>
															</li>
															<li class="divider">
															</li>
															<li>
																<a href="#">
																Separated link </a>
															</li>
														</ul>
													</div>
													<div class="clearfix margin-bottom-10">
													</div>
													<!-- Large button group -->
													<div class="btn-group">
														<button class="btn btn-circle red btn-lg dropdown-toggle" type="button" data-toggle="dropdown">
														Large button <i class="fa fa-angle-down"></i>
														</button>
														<ul class="dropdown-menu" role="menu">
															<li>
																<a href="#">
																Action </a>
															</li>
															<li>
																<a href="#">
																Another action </a>
															</li>
															<li>
																<a href="#">
																Something else here </a>
															</li>
															<li class="divider">
															</li>
															<li>
																<a href="#">
																Separated link </a>
															</li>
														</ul>
													</div>
													<!-- Small button group -->
													<div class="btn-group">
														<button class="btn btn-circle blue btn-sm dropdown-toggle" type="button" data-toggle="dropdown">
														Small button <i class="fa fa-angle-down"></i>
														</button>
														<ul class="dropdown-menu" role="menu">
															<li>
																<a href="#">
																Action </a>
															</li>
															<li>
																<a href="#">
																Another action </a>
															</li>
															<li>
																<a href="#">
																Something else here </a>
															</li>
															<li class="divider">
															</li>
															<li>
																<a href="#">
																Separated link </a>
															</li>
														</ul>
													</div>
													<!-- Extra small button group -->
													<div class="btn-group">
														<button class="btn btn-circle green btn-xs dropdown-toggle" type="button" data-toggle="dropdown">
														Extra small button <i class="fa fa-angle-down"></i>
														</button>
														<ul class="dropdown-menu" role="menu">
															<li>
																<a href="#">
																Action </a>
															</li>
															<li>
																<a href="#">
																Another action </a>
															</li>
															<li>
																<a href="#">
																Something else here </a>
															</li>
															<li class="divider">
															</li>
															<li>
																<a href="#">
																Separated link </a>
															</li>
														</ul>
													</div>
												</div>
												<div class="clearfix">
													<h4 class="block">Dropup</h4>
													<div class="btn-toolbar margin-bottom-10">
														<div class="btn-group btn-group-circle dropup">
															<button type="button" class="btn btn-default">Dropup</button>
															<button type="button" class="btn btn-circle-right btn-default dropdown-toggle" data-toggle="dropdown"><i class="fa fa-angle-up"></i></button>
															<ul class="dropdown-menu" role="menu">
																<li>
																	<a href="#">
																	Action </a>
																</li>
																<li>
																	<a href="#">
																	Another action </a>
																</li>
																<li>
																	<a href="#">
																	Something else here </a>
																</li>
																<li class="divider">
																</li>
																<li>
																	<a href="#">
																	Separated link </a>
																</li>
															</ul>
														</div>
														<!-- /btn-group -->
														<div class="btn-group btn-group-circle dropup">
															<button type="button" class="btn btn-primary">Right dropup</button>
															<button type="button" class="btn btn-circle-right btn-primary dropdown-toggle" data-toggle="dropdown"><i class="fa fa-angle-up"></i></button>
															<ul class="dropdown-menu pull-right" role="menu">
																<li>
																	<a href="#">
																	Action </a>
																</li>
																<li>
																	<a href="#">
																	Another action </a>
																</li>
																<li>
																	<a href="#">
																	Something else here </a>
																</li>
																<li class="divider">
																</li>
																<li>
																	<a href="#">
																	Separated link </a>
																</li>
															</ul>
														</div>
														<!-- /btn-group -->
													</div>
													<div class="btn-toolbar">
														<div class="btn-group btn-group-circle dropup">
															<button type="button" class="btn blue">Dropup</button>
															<button type="button" class="btn btn-circle-right blue dropdown-toggle" data-toggle="dropdown"><i class="fa fa-angle-up"></i></button>
															<ul class="dropdown-menu" role="menu">
																<li>
																	<a href="#">
																	Action </a>
																</li>
																<li>
																	<a href="#">
																	Another action </a>
																</li>
																<li>
																	<a href="#">
																	Something else here </a>
																</li>
																<li class="divider">
																</li>
																<li>
																	<a href="#">
																	Separated link </a>
																</li>
															</ul>
														</div>
														<!-- /btn-group -->
														<div class="btn-group btn-group-circle dropup">
															<button type="button" class="btn green">Right dropup</button>
															<button type="button" class="btn btn-circle-right green dropdown-toggle" data-toggle="dropdown"><i class="fa fa-angle-up"></i></button>
															<ul class="dropdown-menu pull-right" role="menu">
																<li>
																	<a href="#">
																	Action </a>
																</li>
																<li>
																	<a href="#">
																	Another action </a>
																</li>
																<li>
																	<a href="#">
																	Something else here </a>
																</li>
																<li class="divider">
																</li>
																<li>
																	<a href="#">
																	Separated link </a>
																</li>
															</ul>
														</div>
														<!-- /btn-group -->
													</div>
												</div>
												<div class="clearfix">
													<h4 class="block">Hoveralbe Dropdowns</h4>
													<div class="btn-toolbar margin-bottom-10">
														<div class="btn-group btn-group-circle">
															<button type="button" class="btn btn-default">Dropdown</button>
															<button type="button" class="btn btn-circle-right btn-default dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-delay="1000" data-close-others="true"><i class="fa fa-angle-down"></i></button>
															<ul class="dropdown-menu" role="menu">
																<li>
																	<a href="#">
																	Action </a>
																</li>
																<li>
																	<a href="#">
																	Another action </a>
																</li>
																<li>
																	<a href="#">
																	Something else here </a>
																</li>
																<li class="divider">
																</li>
																<li>
																	<a href="#">
																	Separated link </a>
																</li>
															</ul>
														</div>
														<!-- /btn-group -->
														<div class="btn-group btn-group-circle dropup">
															<button type="button" class="btn btn-primary">Dropup</button>
															<button type="button" class="btn btn-circle-right btn-primary dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-delay="1000" data-close-others="true"><i class="fa fa-angle-up"></i></button>
															<ul class="dropdown-menu" role="menu">
																<li>
																	<a href="#">
																	Action </a>
																</li>
																<li>
																	<a href="#">
																	Another action </a>
																</li>
																<li>
																	<a href="#">
																	Something else here </a>
																</li>
																<li class="divider">
																</li>
																<li>
																	<a href="#">
																	Separated link </a>
																</li>
															</ul>
														</div>
														<!-- /btn-group -->
														<div class="btn-group">
															<button type="button" class="btn btn-circle btn-success dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-delay="1000" data-close-others="true">
															Dropup <i class="fa fa-angle-down"></i>
															</button>
															<ul class="dropdown-menu" role="menu">
																<li>
																	<a href="#">
																	Action </a>
																</li>
																<li>
																	<a href="#">
																	Another action </a>
																</li>
																<li>
																	<a href="#">
																	Something else here </a>
																</li>
																<li class="divider">
																</li>
																<li>
																	<a href="#">
																	Separated link </a>
																</li>
															</ul>
														</div>
														<!-- /btn-group -->
													</div>
													<div class="btn-toolbar">
														<div class="btn-group btn-group-circle">
															<button type="button" class="btn blue">Dropdown</button>
															<button type="button" class="btn btn-circle-right blue dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-delay="1000" data-close-others="true"><i class="fa fa-angle-down"></i></button>
															<ul class="dropdown-menu" role="menu">
																<li>
																	<a href="#">
																	Action </a>
																</li>
																<li>
																	<a href="#">
																	Another action </a>
																</li>
																<li>
																	<a href="#">
																	Something else here </a>
																</li>
																<li class="divider">
																</li>
																<li>
																	<a href="#">
																	Separated link </a>
																</li>
															</ul>
														</div>
														<!-- /btn-group -->
														<div class="btn-group btn-group-circle dropup">
															<button type="button" class="btn green">Dropup</button>
															<button type="button" class="btn btn-circle-right green dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-delay="1000" data-close-others="true">
															<i class="fa fa-angle-up"></i></button>
															<ul class="dropdown-menu" role="menu">
																<li>
																	<a href="#">
																	Action </a>
																</li>
																<li>
																	<a href="#">
																	Another action </a>
																</li>
																<li>
																	<a href="#">
																	Something else here </a>
																</li>
																<li class="divider">
																</li>
																<li>
																	<a href="#">
																	Separated link </a>
																</li>
															</ul>
														</div>
														<!-- /btn-group -->
														<div class="btn-group">
															<button type="button" class="btn btn-circle yellow dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-delay="1000" data-close-others="true">
															Dropdown <i class="fa fa-angle-down"></i>
															</button>
															<ul class="dropdown-menu" role="menu">
																<li>
																	<a href="#">
																	Action </a>
																</li>
																<li>
																	<a href="#">
																	Another action </a>
																</li>
																<li>
																	<a href="#">
																	Something else here </a>
																</li>
																<li class="divider">
																</li>
																<li>
																	<a href="#">
																	Separated link </a>
																</li>
															</ul>
														</div>
														<!-- /btn-group -->
													</div>
												</div>
												<div class="clearfix">
													<h4 class="block">Dropdown with Checkboxes & Search Form</h4>
													<div class="btn-group">
														<button class="btn btn-circle green dropdown-toggle" type="button" data-toggle="dropdown">
														Search Dropdown <i class="fa fa-angle-down"></i>
														</button>
														<div class="dropdown-menu dropdown-content input-large hold-on-click" role="menu">
															<form action="#">
																<div class="input-group">
																	<input type="text" class="form-control input-circle-left" placeholder="search...">
																	<span class="input-group-btn">
																	<button class="btn btn-circle-right blue" type="submit">Go!</button>
																	</span>
																</div>
															</form>
														</div>
													</div>
													<div class="btn-group btn-group-circle">
														<button type="button" class="btn blue">Dropdown</button>
														<button type="button" class="btn btn-circle-right blue dropdown-toggle" data-toggle="dropdown"><i class="fa fa-angle-down"></i></button>
														<div class="dropdown-menu hold-on-click dropdown-checkboxes" role="menu">
															<label><input type="checkbox">Option 1</label>
															<label><input type="checkbox" checked>Option 2</label>
															<label><input type="checkbox">Option 3</label>
															<label><input type="checkbox" checked>Option 4</label>
															<label><input type="checkbox">Option 5</label>
														</div>
													</div>
													<!-- /btn-group -->
													<div class="btn-group btn-group-circle dropup">
														<button type="button" class="btn green">Dropup</button>
														<button type="button" class="btn btn-circle-right green dropdown-toggle" data-toggle="dropdown"><i class="fa fa-angle-up"></i></button>
														<div class="dropdown-menu hold-on-click dropdown-checkboxes" role="menu">
															<label><input type="checkbox">Option 1</label>
															<label><input type="checkbox" checked>Option 2</label>
															<label><input type="checkbox">Option 3</label>
															<label><input type="checkbox" checked>Option 4</label>
															<label><input type="checkbox">Option 5</label>
														</div>
													</div>
													<!-- /btn-group -->
													<div class="clearfix margin-top-10">
														<span class="label label-success">
														NOTE: </span>
														&nbsp; By adding <code>hold-on-click</code> class you can avoid closing the dropdown on click
													</div>
												</div>
												<div class="clearfix">
													<h4 class="block">Dropdown with Radio Buttons</h4>
													<div class="btn-group btn-group-circle">
														<button type="button" class="btn blue">Dropdown</button>
														<button type="button" class="btn btn-circle-right blue dropdown-toggle" data-toggle="dropdown"><i class="fa fa-angle-down"></i></button>
														<div class="dropdown-menu hold-on-click dropdown-radiobuttons" role="menu">
															<label><input type="radio" name="radio_button_1">Option 1</label>
															<label><input type="radio" name="radio_button_1">Option 2</label>
															<label><input type="radio" name="radio_button_1">Option 3</label>
															<label><input type="radio" name="radio_button_1">Option 4</label>
															<label><input type="radio" name="radio_button_1">Option 5</label>
														</div>
													</div>
													<!-- /btn-group -->
													<div class="btn-group btn-group-circle dropup">
														<button type="button" class="btn green">Dropup</button>
														<button type="button" class="btn btn-circle-right green dropdown-toggle" data-toggle="dropdown"><i class="fa fa-angle-up"></i></button>
														<div class="dropdown-menu hold-on-click dropdown-radiobuttons" role="menu">
															<label><input type="radio" name="radio_button_2">Option 1</label>
															<label><input type="radio" name="radio_button_2">Option 2</label>
															<label><input type="radio" name="radio_button_2">Option 3</label>
															<label><input type="radio" name="radio_button_2">Option 4</label>
															<label><input type="radio" name="radio_button_2">Option 5</label>
														</div>
													</div>
													<!-- /btn-group -->
													<div class="clearfix margin-top-10">
														<span class="label label-success">
														NOTE: </span>
														&nbsp; By adding <code>hold-on-click</code> class you can avoid closing the dropdown on click
													</div>
												</div>
											</div>
											<!-- END DROPDOWNS PORTLET-->
										</div>
										<div class="portlet box green util-btn-group-margin-bottom-5">
											<div class="portlet-title">
												<div class="caption">
													<i class="fa fa-gift"></i>
													<span class="hidden-480">
													Button States </span>
												</div>
											</div>
											<div class="portlet-body util-btn-margin-bottom-5">
												<h4>Loading State</h4>
												<div class="clearfix">
													<button type="button" data-loading-text="Loading..." class="demo-loading-btn btn-circle btn btn-primary">
													Loading state </button>
													<button type="button" data-loading-text="Loading..." class="demo-loading-btn btn-circle btn btn-default">
													Loading state </button>
													<button type="button" data-loading-text="Loading..." class="demo-loading-btn btn-circle btn red">
													Loading state </button>
													<button type="button" data-loading-text="Loading..." class="demo-loading-btn btn-circle btn blue">
													Loading state </button>
												</div>
												<h4>Single Toggle</h4>
												<div class="clearfix">
													<button type="button" class="btn btn-circle btn-primary" data-toggle="button">
													Single toggle </button>
													<button type="button" class="btn btn-circle btn-default" data-toggle="button">
													Single toggle </button>
													<button type="button" class="btn btn-circle red" data-toggle="button">
													Single toggle </button>
													<button type="button" class="btn btn-circle blue" data-toggle="button">
													Single toggle </button>
												</div>
												<h4>Checkbox</h4>
												<div class="clearfix">
													<div class="btn-group btn-group-circle" data-toggle="buttons">
														<label class="btn default active">
														<input type="checkbox" class="toggle"> Option 1 </label>
														<label class="btn default">
														<input type="checkbox" class="toggle"> Option 2 </label>
														<label class="btn default">
														<input type="checkbox" class="toggle"> Option 3 </label>
													</div>
												</div>
												<div class="clearfix">
													<div class="btn-group btn-group-circle" data-toggle="buttons">
														<label class="btn btn-default">
														<input type="checkbox" class="toggle"> Option 1 </label>
														<label class="btn btn-default active">
														<input type="checkbox" class="toggle"> Option 2 </label>
														<label class="btn btn-default">
														<input type="checkbox" class="toggle"> Option 3 </label>
													</div>
												</div>
												<h4>Radio</h4>
												<div class="clearfix">
													<div class="btn-group btn-group-circle" data-toggle="buttons">
														<label class="btn blue active">
														<input type="radio" class="toggle"> Option 1 </label>
														<label class="btn blue">
														<input type="radio" class="toggle"> Option 2 </label>
														<label class="btn blue">
														<input type="radio" class="toggle"> Option 3 </label>
													</div>
												</div>
												<div class="clearfix">
													<div class="btn-group btn-group-circle" data-toggle="buttons">
														<label class="btn btn-default active">
														<input type="radio" class="toggle"> Option 1 </label>
														<label class="btn btn-default">
														<input type="radio" class="toggle"> Option 2 </label>
														<label class="btn btn-default">
														<input type="radio" class="toggle"> Option 3 </label>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
