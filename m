Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 6A76D71A50
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Dec 2017 02:01:56 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="30678532"
Received: from localhost (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 04 Dec 2017 10:01:54 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 7423548AE743;
	Mon,  4 Dec 2017 10:01:52 +0800 (CST)
Received: from G08CNEXMBPEKD01.g08.fujitsu.local ([10.167.33.81]) by
	G08CNEXCHPEKD01.g08.fujitsu.local ([10.167.33.80]) with mapi id
	14.03.0361.001; Mon, 4 Dec 2017 10:01:53 +0800
From: "Zheng, Ruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] libyui
Thread-Index: AQHTaNB03T/drIUTQUK2Znhg9gu0fqMqZB8AgAgR4BA=
Date: Mon, 4 Dec 2017 02:01:52 +0000
Message-ID: <33D4DBCAC5F2D74E96B07F6E7632BF732EEA4D08@G08CNEXMBPEKD01.g08.fujitsu.local>
References: <1511932233-21738-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
	<b825822d-713c-d31a-e071-bf0733555040@linux.intel.com>
In-Reply-To: <b825822d-713c-d31a-e071-bf0733555040@linux.intel.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.0.0.116
dlp-reaction: no-action
x-originating-ip: [10.167.225.116]
MIME-Version: 1.0
X-yoursite-MailScanner-ID: 7423548AE743.A60C5
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: Re: [PATCH] libyui
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
X-List-Received-Date: Mon, 04 Dec 2017 02:01:57 -0000
Content-Language: zh-CN
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgQWxleDoNCiAgIEkgYXR0ZW5kIHRvIG1ha2UgZG5mZHJhZ29yYSh3aGlj
aCBpcyBhIGd1aSBmb3IgZG5mKSB1c2VkIGluIG9lLWNvcmUsIGFuZCBsaWJ5
dWkgaXMgdGhlIGRlcGVuZCBvZiBkbmZkcmFnb3JhLg0KDQotLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KWmhl
bmcgUnVvcWluDQpOYW5qaW5nIEZ1aml0c3UgTmFuZGEgU29mdHdhcmUgVGVj
aC4gQ28uLCBMdGQuKEZOU1QpDQpBRERSLjogTm8uNiBXZW56aHUgUm9hZCwg
U29mdHdhcmUgQXZlbnVlLA0KICAgICAgIE5hbmppbmcsIDIxMDAxMiwgQ2hp
bmENCk1BSUwgOiB6aGVuZ3JxLmZuc3RAY24uZnVqaXN0dS5jb20NCg0KDQot
LS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogQWxleGFuZGVyIEth
bmF2aW4gW21haWx0bzphbGV4YW5kZXIua2FuYXZpbkBsaW51eC5pbnRlbC5j
b21dIA0KU2VudDogV2VkbmVzZGF5LCBOb3ZlbWJlciAyOSwgMjAxNyAyOjQ4
IFBNDQpUbzogWmhlbmcsIFJ1b3Fpbi/pg5Eg6Iul6ZKmIDx6aGVuZ3JxLmZu
c3RAY24uZnVqaXRzdS5jb20+OyBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5v
cGVuZW1iZWRkZWQub3JnDQpTdWJqZWN0OiBSZTogW09FLWNvcmVdIFtQQVRD
SF0gbGlieXVpDQoNCk9uIDExLzI5LzIwMTcgMDc6MTAgQU0sIHpoZW5ncnEg
d3JvdGU6DQo+IEFkZCBhIG5ldyByZWNpcGUgbGlieXVpLg0KDQoNCkFkZCB3
aHk/IFdoYXQgZG9lcyBpdCBkbz8gV2h5IHNob3VsZCBpdCBiZSBpbiBvZS1j
b3JlPw0KDQpBbGV4DQoNCg0KCgo=

