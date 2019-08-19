<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" session="false" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:template pageTitle="Cookie Page">
	<jsp:attribute name="navigation">
		<t:nav_login>
		</t:nav_login>
	</jsp:attribute>
	<jsp:body>
	<div class="container py-5">
		<div class="row">
			<div class="offset-md-2 col-md-8 offset-md-2">
				<div class="card bgHexagonLogo text-white bg-secondary">
					<div class="card-header bg-dark text-danger">
						<h4 class="card-title text-uppercase mt-1 mb-1">Oops...</h4>
					</div>
					<div class="card-body">
						<div class="row text-center">
							<div class="col-lg-12 col-md-12 col-sm-12 col-12">
								<h3 class="text-info">Cookie monster is sad you have no cookie!</h3>
							</div>
						</div>
						<div class="row text-center">
							<div class="col-lg-12 col-md-12 col-sm-12 col-12">
								<img class="img-fluid rounded" src="images/ShabbyFreshKitten-max-1mb.gif" alt="Cookie Monster eating cookies">
							</div>
						</div>
						<div class="row">
							<div class="col-lg-12 col-md-12 col-sm-12 col-12">
								<a class="text-warning" href="/DonDiablo/">Fetch the cookie</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</jsp:body>
</t:template>