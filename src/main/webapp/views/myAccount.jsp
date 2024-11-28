<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<!-- BEGIN CONTENT -->
<div class="col-md-12 col-sm-12">
    <h1>My Account Page</h1>
    <div class="content-page">
        <div class="profile-content">
            <div class="row">
                <div class="col-md-12">
                    <div class="portlet light">
                        <div class="portlet-title tabbable-line">
                            <div class="caption caption-md">
                                <span class="caption-subject font-blue-madison bold uppercase">Profile Account</span>
                            </div>
                            <ul class="nav nav-tabs">
                                <li class="active">
                                    <a href="#tab_1_1" data-toggle="tab">Personal Info</a>
                                </li>
                                <li>
                                    <a href="#tab_1_2" data-toggle="tab">Change Avatar</a>
                                </li>
                                <li>
                                    <a href="#tab_1_3" data-toggle="tab">Change Password</a>
                                </li>
                                <li>
                                    <a href="#tab_1_4" data-toggle="tab">Delete Account</a>
                                </li>
                            </ul>
                        </div>
                        <div class="portlet-body">
                         <!-- Thêm thông báo alert -->
                            <% 
                                String alert = (String) request.getAttribute("alert"); 
                                if (alert != null) { 
                            %>
                                <div class="alert alert-info">
                                    <%= alert %>
                                </div>
                            <% 
                                } 
                            %>
                            <div class="tab-content">
                                <!-- PERSONAL INFO TAB -->
                                <div class="tab-pane active" id="tab_1_1">
                                    <form role="form" action="${pageContext.request.contextPath}/myaccount" method="post">
                                        <div class="form-group">
								            <label for="email">Email:</label>
								            <input type="email" id="email" name="email" class="form-control" value="${sessionScope.account.email}" />
								        </div>
                                        <div class="form-group">
                                            <label class="control-label">Full Name</label>
                                            <input type="text" name="fullname" value="${sessionScope.account.fullname}" class="form-control" />
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label">Mobile Number</label>
                                            <input type="text" name="phone" value="${sessionScope.account.phone}" class="form-control" placeholder="+1 646 580 DEMO (6284)"/>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label">Address</label>
                                            <br>
                                            <label class="control-label">Ward</label>
                                            <input type="text" name="ward" value="${sessionScope.account.address.ward}" class="form-control" placeholder="Tang Nhon Phu A"/>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label">District</label>
                                            <input type="text" name="district" value="${sessionScope.account.address.district}" class="form-control" placeholder="Thu Duc"/>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label">City</label>
                                            <input type="text" name="city" value="${sessionScope.account.address.city}" class="form-control" placeholder="Thanh Pho Ho Chi Minh"/>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label">Detail</label>
                                            <textarea name="detail" class="form-control" rows="3" placeholder="No description">${sessionScope.account.address.detail}</textarea>
                                        </div>
                                        <div class="margiv-top-10">
                                            <button type="submit" class="btn green-haze">Save Changes</button>
                                            <a href="#" class="btn default">Cancel</a>
                                        </div>
                                    </form>
                                </div>
                                <!-- END PERSONAL INFO TAB -->
                                 <!-- CHANGE AVATAR TAB -->
                                <div class="tab-pane" id="tab_1_2">
                                    <form action="${pageContext.request.contextPath}/uploadAvatar" method="post" enctype="multipart/form-data" role="form">
                                        <div class="form-group">
                                            <div class="fileinput fileinput-new" data-provides="fileinput">
                                                <div class="fileinput-new thumbnail" style="width: 200px; height: 150px;">
                                                    <img id="avatarPreview" src="${pageContext.request.contextPath}/${sessionScope.account.image}" alt="User Avatar" />
                                                </div>
                                                <div>
                                                    <span class="btn default btn-file">
                                                        <span class="fileinput-new">Select image</span>
                                                        <span class="fileinput-exists">Change</span>
                                                        <input type="file" name="avatar" id="avatarInput" required>
                                                    </span>
                                                    <a href="#" class="btn default fileinput-exists" data-dismiss="fileinput" id="removeAvatarBtn">Remove</a>
                                                </div>
                                            </div>
                                            <div class="clearfix margin-top-10">
                                                <span class="label label-danger">NOTE!</span>
                                                <span>Attached image thumbnail is supported in latest browsers.</span>
                                            </div>
                                        </div>
                                        <div class="margin-top-10">
                                            <button type="submit" class="btn green-haze">Submit</button>
                                            <a href="#" class="btn default" id="cancelBtn">Cancel</a>
                                        </div>
                                    </form>
                                </div>
                                <!-- END CHANGE AVATAR TAB -->
                                <!-- CHANGE PASSWORD TAB -->
								<div class="tab-pane" id="tab_1_3">
								    <form action="${pageContext.request.contextPath}/changePassword" method="post">
								        <div class="form-group">
								            <label class="control-label">Current Password</label>
								            <input type="password" name="currentPassword" class="form-control"/>
								        </div>
								        <div class="form-group">
								            <label class="control-label">New Password</label>
								            <input type="password" name="newPassword" class="form-control"/>
								        </div>
								        <div class="form-group">
								            <label class="control-label">Re-type New Password</label>
								            <input type="password" name="retypeNewPassword" class="form-control"/>
								        </div>
								        <div class="margin-top-10">
								            <button type="submit" class="btn green-haze">Change Password</button>
								            <a href="#" class="btn default">Cancel</a>
								        </div>
								    </form>
								</div>
								<!-- END CHANGE PASSWORD TAB -->
                                <!-- DELETE ACCOUNT TAB -->
                                <div class="tab-pane" id="tab_1_4">
                                    <form action="#" method="post">
                                        <table class="table table-light table-hover">
                                            <tr>
                                                <td>We're sorry you're leaving. Deleted accounts will not be reopened.</td>
                                                <td>
                                                    <label class="uniform-inline">
                                                        <input type="radio" name="deleteAccount" value="yes"/> Yes
                                                    </label>
                                                    <label class="uniform-inline">
                                                        <input type="radio" name="deleteAccount" value="no" checked/> No
                                                    </label>
                                                </td>
                                            </tr>
                                        </table>
                                        <div class="margin-top-10">
                                            <button type="submit" class="btn green-haze">Save Changes</button>
                                            <a href="#" class="btn default">Cancel</a>
                                        </div>
                                    </form>
                                </div>
                                <!-- END DELETE ACCOUNT TAB -->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <hr>
        <h3>My Orders</h3>
        <ul>
            <li><a href="#">View your order history</a></li>
            <li><a href="#">Downloads</a></li>
            <li><a href="#">Your Reward Points</a></li>
            <li><a href="#">View your return requests</a></li>
            <li><a href="#">Your Transactions</a></li>
        </ul>
    </div>
</div>
<!-- END CONTENT -->

<script>
    // Khi người dùng chọn ảnh mới, cập nhật ảnh preview
    document.getElementById('avatarInput').addEventListener('change', function(event) {
        var reader = new FileReader();
        reader.onload = function(e) {
            document.getElementById('avatarPreview').src = e.target.result;  // Hiển thị ảnh đã chọn
        };
        reader.readAsDataURL(this.files[0]);
    });

    // Khi nhấn "Remove", quay lại ảnh mặc định
    document.getElementById('removeAvatarBtn').addEventListener('click', function(event) {
        event.preventDefault();
        document.getElementById('avatarPreview').src = "${pageContext.request.contextPath}/${sessionScope.account.image}";  // Hiển thị ảnh mặc định
        document.getElementById('avatarInput').value = '';  // Reset input file
    });

    // Khi nhấn "Cancel", reset input file
    document.getElementById('cancelBtn').addEventListener('click', function(event) {
        event.preventDefault();
        document.getElementById('avatarInput').value = '';  // Reset input file
    });
</script>