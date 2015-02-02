Return-Path: <bruno.bottazzini@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 07EB660138
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Feb 2015 12:39:47 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga102.fm.intel.com with ESMTP; 02 Feb 2015 04:39:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,506,1418112000"; 
	d="scan'208,217";a="679652832"
Received: from orsmsx101.amr.corp.intel.com ([10.22.225.128])
	by orsmga002.jf.intel.com with ESMTP; 02 Feb 2015 04:39:39 -0800
Received: from orsmsx154.amr.corp.intel.com (10.22.226.12) by
	ORSMSX101.amr.corp.intel.com (10.22.225.128) with Microsoft SMTP Server
	(TLS) id 14.3.195.1; Mon, 2 Feb 2015 04:39:38 -0800
Received: from crsmsx102.amr.corp.intel.com (172.18.63.137) by
	ORSMSX154.amr.corp.intel.com (10.22.226.12) with Microsoft SMTP Server
	(TLS) id 14.3.195.1; Mon, 2 Feb 2015 04:39:38 -0800
Received: from crsmsx101.amr.corp.intel.com ([169.254.1.222]) by
	CRSMSX102.amr.corp.intel.com ([169.254.2.157]) with mapi id
	14.03.0195.001; Mon, 2 Feb 2015 06:39:36 -0600
From: "Bottazzini, Bruno" <bruno.bottazzini@intel.com>
To: "Burton, Ross" <ross.burton@intel.com>, Dan McGregor
	<danismostlikely@gmail.com>
Thread-Topic: [OE-core] [PATCH 0/2] kmod new packageconfig and dbus split
	package
Thread-Index: AQHQNbVNBTsSZhU2BUachhEMSy6kUJzV+zQAgAAk9QCAADERgIAAEVqAgAb8jlA=
Date: Mon, 2 Feb 2015 12:39:35 +0000
Message-ID: <C8AA82EBBC8B9244B04CCD7AAE809900BF4EA4@CRSMSX101.amr.corp.intel.com>
References: <bruno.bottazzini@intel.com>
	<1421870458-9958-1-git-send-email-bruno.bottazzini@intel.com>
	<20150128134756.1cce32c4@bottazzini-ThinkPad-T430>
	<CAJTo0LZhj=0AMXXbeXdiUuRBty9qTMX_ba6Z=u=dbhR+v3d+MQ@mail.gmail.com>
	<CACS+7ZQwn67gxNP0HMTxksmW1qoRu_9nas2a-Wzow8wWaWu2zQ@mail.gmail.com>
	<CAJTo0Lb_rQxtgovsRLPALrRqtsye2f6grR1BQO7FHAYJ4x4HPA@mail.gmail.com>
In-Reply-To: <CAJTo0Lb_rQxtgovsRLPALrRqtsye2f6grR1BQO7FHAYJ4x4HPA@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.18.205.10]
MIME-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/2] kmod new packageconfig and dbus split package
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 02 Feb 2015 12:39:50 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_C8AA82EBBC8B9244B04CCD7AAE809900BF4EA4CRSMSX101amrcorpi_"

--_000_C8AA82EBBC8B9244B04CCD7AAE809900BF4EA4CRSMSX101amrcorpi_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

UGluZy4NCg0KRnJvbTogQnVydG9uLCBSb3NzIFttYWlsdG86cm9zcy5idXJ0b25AaW50ZWwuY29t
XQ0KU2VudDogV2VkbmVzZGF5LCBKYW51YXJ5IDI4LCAyMDE1IDU6NTggUE0NClRvOiBEYW4gTWNH
cmVnb3INCkNjOiBCb3R0YXp6aW5pLCBCcnVubzsgT0UtY29yZQ0KU3ViamVjdDogUmU6IFtPRS1j
b3JlXSBbUEFUQ0ggMC8yXSBrbW9kIG5ldyBwYWNrYWdlY29uZmlnIGFuZCBkYnVzIHNwbGl0IHBh
Y2thZ2UNCg0KDQpPbiAyOCBKYW51YXJ5IDIwMTUgYXQgMTg6NTUsIERhbiBNY0dyZWdvciA8ZGFu
aXNtb3N0bGlrZWx5QGdtYWlsLmNvbTxtYWlsdG86ZGFuaXNtb3N0bGlrZWx5QGdtYWlsLmNvbT4+
IHdyb3RlOg0KSXMgdGhlcmUgYSBwdWJsaWMgcGxhY2UgdG8gc2VlIHdoYXQgeW91IGhhdmUgcXVl
dWVkPw0KDQpTdXJlIGl0LCByb3NzL211dCBpbiBwb2t5LWNvbnRyaWIuICBBcyBvZnRlbiBzZWVu
IG9uIHRoZSBhdXRvYnVpbGRlciBpbiBhbGwgcmVkLiA6KQ0KDQpSb3NzDQo=

--_000_C8AA82EBBC8B9244B04CCD7AAE809900BF4EA4CRSMSX101amrcorpi_
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWwgeG1sbnM6dj0idXJuOnNjaGVtYXMtbWljcm9zb2Z0LWNvbTp2bWwiIHhtbG5zOm89InVy
bjpzY2hlbWFzLW1pY3Jvc29mdC1jb206b2ZmaWNlOm9mZmljZSIgeG1sbnM6dz0idXJuOnNjaGVt
YXMtbWljcm9zb2Z0LWNvbTpvZmZpY2U6d29yZCIgeG1sbnM6bT0iaHR0cDovL3NjaGVtYXMubWlj
cm9zb2Z0LmNvbS9vZmZpY2UvMjAwNC8xMi9vbW1sIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcv
VFIvUkVDLWh0bWw0MCI+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIg
Y29udGVudD0idGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjxtZXRhIG5hbWU9IkdlbmVyYXRv
ciIgY29udGVudD0iTWljcm9zb2Z0IFdvcmQgMTUgKGZpbHRlcmVkIG1lZGl1bSkiPg0KPHN0eWxl
PjwhLS0NCi8qIEZvbnQgRGVmaW5pdGlvbnMgKi8NCkBmb250LWZhY2UNCgl7Zm9udC1mYW1pbHk6
IkNhbWJyaWEgTWF0aCI7DQoJcGFub3NlLTE6MiA0IDUgMyA1IDQgNiAzIDIgNDt9DQpAZm9udC1m
YWNlDQoJe2ZvbnQtZmFtaWx5OkNhbGlicmk7DQoJcGFub3NlLTE6MiAxNSA1IDIgMiAyIDQgMyAy
IDQ7fQ0KLyogU3R5bGUgRGVmaW5pdGlvbnMgKi8NCnAuTXNvTm9ybWFsLCBsaS5Nc29Ob3JtYWws
IGRpdi5Nc29Ob3JtYWwNCgl7bWFyZ2luOjBpbjsNCgltYXJnaW4tYm90dG9tOi4wMDAxcHQ7DQoJ
Zm9udC1zaXplOjEyLjBwdDsNCglmb250LWZhbWlseToiVGltZXMgTmV3IFJvbWFuIiwic2VyaWYi
O30NCmE6bGluaywgc3Bhbi5Nc29IeXBlcmxpbmsNCgl7bXNvLXN0eWxlLXByaW9yaXR5Ojk5Ow0K
CWNvbG9yOmJsdWU7DQoJdGV4dC1kZWNvcmF0aW9uOnVuZGVybGluZTt9DQphOnZpc2l0ZWQsIHNw
YW4uTXNvSHlwZXJsaW5rRm9sbG93ZWQNCgl7bXNvLXN0eWxlLXByaW9yaXR5Ojk5Ow0KCWNvbG9y
OnB1cnBsZTsNCgl0ZXh0LWRlY29yYXRpb246dW5kZXJsaW5lO30NCnNwYW4uRW1haWxTdHlsZTE3
DQoJe21zby1zdHlsZS10eXBlOnBlcnNvbmFsLXJlcGx5Ow0KCWZvbnQtZmFtaWx5OiJDYWxpYnJp
Iiwic2Fucy1zZXJpZiI7DQoJY29sb3I6IzFGNDk3RDt9DQouTXNvQ2hwRGVmYXVsdA0KCXttc28t
c3R5bGUtdHlwZTpleHBvcnQtb25seTsNCglmb250LWZhbWlseToiQ2FsaWJyaSIsInNhbnMtc2Vy
aWYiO30NCkBwYWdlIFdvcmRTZWN0aW9uMQ0KCXtzaXplOjguNWluIDExLjBpbjsNCgltYXJnaW46
MS4waW4gMS4waW4gMS4waW4gMS4waW47fQ0KZGl2LldvcmRTZWN0aW9uMQ0KCXtwYWdlOldvcmRT
ZWN0aW9uMTt9DQotLT48L3N0eWxlPjwhLS1baWYgZ3RlIG1zbyA5XT48eG1sPg0KPG86c2hhcGVk
ZWZhdWx0cyB2OmV4dD0iZWRpdCIgc3BpZG1heD0iMTAyNiIgLz4NCjwveG1sPjwhW2VuZGlmXS0t
PjwhLS1baWYgZ3RlIG1zbyA5XT48eG1sPg0KPG86c2hhcGVsYXlvdXQgdjpleHQ9ImVkaXQiPg0K
PG86aWRtYXAgdjpleHQ9ImVkaXQiIGRhdGE9IjEiIC8+DQo8L286c2hhcGVsYXlvdXQ+PC94bWw+
PCFbZW5kaWZdLS0+DQo8L2hlYWQ+DQo8Ym9keSBsYW5nPSJFTi1VUyIgbGluaz0iYmx1ZSIgdmxp
bms9InB1cnBsZSI+DQo8ZGl2IGNsYXNzPSJXb3JkU2VjdGlvbjEiPg0KPHAgY2xhc3M9Ik1zb05v
cm1hbCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQ7Zm9udC1mYW1pbHk6JnF1b3Q7Q2Fs
aWJyaSZxdW90OywmcXVvdDtzYW5zLXNlcmlmJnF1b3Q7O2NvbG9yOiMxRjQ5N0QiPlBpbmcuPG86
cD48L286cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PGEgbmFtZT0iX01haWxF
bmRDb21wb3NlIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBwdDtmb250LWZhbWlseTomcXVv
dDtDYWxpYnJpJnF1b3Q7LCZxdW90O3NhbnMtc2VyaWYmcXVvdDs7Y29sb3I6IzFGNDk3RCI+PG86
cD4mbmJzcDs8L286cD48L3NwYW4+PC9hPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxiPjxz
cGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0O2ZvbnQtZmFtaWx5OiZxdW90O0NhbGlicmkmcXVv
dDssJnF1b3Q7c2Fucy1zZXJpZiZxdW90OyI+RnJvbTo8L3NwYW4+PC9iPjxzcGFuIHN0eWxlPSJm
b250LXNpemU6MTEuMHB0O2ZvbnQtZmFtaWx5OiZxdW90O0NhbGlicmkmcXVvdDssJnF1b3Q7c2Fu
cy1zZXJpZiZxdW90OyI+IEJ1cnRvbiwgUm9zcyBbbWFpbHRvOnJvc3MuYnVydG9uQGludGVsLmNv
bV0NCjxicj4NCjxiPlNlbnQ6PC9iPiBXZWRuZXNkYXksIEphbnVhcnkgMjgsIDIwMTUgNTo1OCBQ
TTxicj4NCjxiPlRvOjwvYj4gRGFuIE1jR3JlZ29yPGJyPg0KPGI+Q2M6PC9iPiBCb3R0YXp6aW5p
LCBCcnVubzsgT0UtY29yZTxicj4NCjxiPlN1YmplY3Q6PC9iPiBSZTogW09FLWNvcmVdIFtQQVRD
SCAwLzJdIGttb2QgbmV3IHBhY2thZ2Vjb25maWcgYW5kIGRidXMgc3BsaXQgcGFja2FnZTxvOnA+
PC9vOnA+PC9zcGFuPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxvOnA+Jm5ic3A7PC9vOnA+
PC9wPg0KPGRpdj4NCjxkaXY+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48bzpwPiZuYnNwOzwvbzpw
PjwvcD4NCjxkaXY+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj5PbiAyOCBKYW51YXJ5IDIwMTUgYXQg
MTg6NTUsIERhbiBNY0dyZWdvciAmbHQ7PGEgaHJlZj0ibWFpbHRvOmRhbmlzbW9zdGxpa2VseUBn
bWFpbC5jb20iIHRhcmdldD0iX2JsYW5rIj5kYW5pc21vc3RsaWtlbHlAZ21haWwuY29tPC9hPiZn
dDsgd3JvdGU6PG86cD48L286cD48L3A+DQo8YmxvY2txdW90ZSBzdHlsZT0iYm9yZGVyOm5vbmU7
Ym9yZGVyLWxlZnQ6c29saWQgI0NDQ0NDQyAxLjBwdDtwYWRkaW5nOjBpbiAwaW4gMGluIDYuMHB0
O21hcmdpbi1sZWZ0OjQuOHB0O21hcmdpbi1yaWdodDowaW4iPg0KPGRpdiBpZD0iOjR5NiI+DQo8
cCBjbGFzcz0iTXNvTm9ybWFsIj5JcyB0aGVyZSBhIHB1YmxpYyBwbGFjZSB0byBzZWUgd2hhdCB5
b3UgaGF2ZSBxdWV1ZWQ/PG86cD48L286cD48L3A+DQo8L2Rpdj4NCjwvYmxvY2txdW90ZT4NCjwv
ZGl2Pg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PGJyPg0KU3VyZSBpdCwgcm9zcy9tdXQgaW4gcG9r
eS1jb250cmliLiZuYnNwOyBBcyBvZnRlbiBzZWVuIG9uIHRoZSBhdXRvYnVpbGRlciBpbiBhbGwg
cmVkLiA6KTxvOnA+PC9vOnA+PC9wPg0KPC9kaXY+DQo8ZGl2Pg0KPHAgY2xhc3M9Ik1zb05vcm1h
bCI+PG86cD4mbmJzcDs8L286cD48L3A+DQo8L2Rpdj4NCjxkaXY+DQo8cCBjbGFzcz0iTXNvTm9y
bWFsIj5Sb3NzPG86cD48L286cD48L3A+DQo8L2Rpdj4NCjwvZGl2Pg0KPC9kaXY+DQo8L2JvZHk+
DQo8L2h0bWw+DQo=

--_000_C8AA82EBBC8B9244B04CCD7AAE809900BF4EA4CRSMSX101amrcorpi_--
