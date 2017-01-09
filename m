Return-Path: <amarnath.valluri@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id B86DE71A54
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Jan 2017 07:13:14 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga105.jf.intel.com with ESMTP; 08 Jan 2017 23:13:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,339,1477983600"; 
	d="scan'208,217";a="1091600631"
Received: from irdmzpr05.ir.intel.com (HELO [163.33.54.155]) ([163.33.54.155])
	by fmsmga001.fm.intel.com with ESMTP; 08 Jan 2017 23:13:13 -0800
To: "Burton, Ross" <ross.burton@intel.com>
References: <1483531104-32135-1-git-send-email-amarnath.valluri@intel.com>
	<CAJTo0LaYG+mHGWOse4Yn7nLVT6wtP+x=f=fwgy=Q4wmmPyWQVg@mail.gmail.com>
From: avalluri <amarnath.valluri@intel.com>
Message-ID: <0a1ab511-2e32-6d9e-7336-ca3cb878a227@intel.com>
Date: Mon, 9 Jan 2017 09:14:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.5.1
MIME-Version: 1.0
In-Reply-To: <CAJTo0LaYG+mHGWOse4Yn7nLVT6wtP+x=f=fwgy=Q4wmmPyWQVg@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] kernel: Modify kernel modules installation path.
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
X-List-Received-Date: Mon, 09 Jan 2017 07:13:15 -0000
Content-Type: multipart/alternative;
	boundary="------------D317D2E922D0910B827BC581"

--------------D317D2E922D0910B827BC581
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: base64

CgpPbiAwNS4wMS4yMDE3IDE4OjI5LCBCdXJ0b24sIFJvc3Mgd3JvdGU6Cj4KPiBPbiA0IEphbnVh
cnkgMjAxNyBhdCAxMTo1OCwgQW1hcm5hdGggVmFsbHVyaSAKPiA8YW1hcm5hdGgudmFsbHVyaUBp
bnRlbC5jb20gPG1haWx0bzphbWFybmF0aC52YWxsdXJpQGludGVsLmNvbT4+IHdyb3RlOgo+Cj4g
ICAgIFVzZSAke2Jhc2VfbGliZGlyfS9tb2R1bGVzIGlucGxhY2Ugb2YgL2xpYi9tb2R1bGVzIGZv
ciBrZXJuZWwKPiAgICAgbW9kdWxlcyBpbnN0YWxsYXRpb24gcGF0aC4KPgo+Cj4gRG9lcyB0aGUg
a2VybmVsIGFjdHVhbGx5IHJlc3BlY3QgJHtiYXNlX2xpYmRpcn0/ClllcyBSb3NzLCBLZXJuZWwg
YWxsb3dzIHRvIGFsdGVyIG1vZHVsZXMsIGZpcm13YXJlIGluc3RhbGxhdGlvbiBwYXRoIHZpYSAK
TU9ETElCIGFuZCBJTlNUQUxMX0ZXX1BBVEggZW52aXJvbm1lbnQgdmFyaWFibGVzLgoKLSBBbWFy
bmF0aAotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0KSW50ZWwgRmlubGFuZCBPeQpSZWdpc3RlcmVkIEFkZHJlc3M6IFBM
IDI4MSwgMDAxODEgSGVsc2lua2kgCkJ1c2luZXNzIElkZW50aXR5IENvZGU6IDAzNTc2MDYgLSA0
IApEb21pY2lsZWQgaW4gSGVsc2lua2kgCgpUaGlzIGUtbWFpbCBhbmQgYW55IGF0dGFjaG1lbnRz
IG1heSBjb250YWluIGNvbmZpZGVudGlhbCBtYXRlcmlhbCBmb3IKdGhlIHNvbGUgdXNlIG9mIHRo
ZSBpbnRlbmRlZCByZWNpcGllbnQocykuIEFueSByZXZpZXcgb3IgZGlzdHJpYnV0aW9uCmJ5IG90
aGVycyBpcyBzdHJpY3RseSBwcm9oaWJpdGVkLiBJZiB5b3UgYXJlIG5vdCB0aGUgaW50ZW5kZWQK
cmVjaXBpZW50LCBwbGVhc2UgY29udGFjdCB0aGUgc2VuZGVyIGFuZCBkZWxldGUgYWxsIGNvcGll
cy4K

--------------D317D2E922D0910B827BC581
MIME-Version: 1.0
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+CiAgPGhlYWQ+CiAgICA8bWV0YSBjb250ZW50PSJ0ZXh0L2h0bWw7IGNoYXJzZXQ9dXRm
LTgiIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSI+CiAgPC9oZWFkPgogIDxib2R5IGJnY29sb3I9
IiNGRkZGRkYiIHRleHQ9IiMwMDAwMDAiPgogICAgPHA+PGJyPgogICAgPC9wPgogICAgPGJyPgog
ICAgPGRpdiBjbGFzcz0ibW96LWNpdGUtcHJlZml4Ij5PbiAwNS4wMS4yMDE3IDE4OjI5LCBCdXJ0
b24sIFJvc3MKICAgICAgd3JvdGU6PGJyPgogICAgPC9kaXY+CiAgICA8YmxvY2txdW90ZQpjaXRl
PSJtaWQ6Q0FKVG8wTGFZRyttSEdXT3NlNFluN25MVlQ2d3RQK3g9Zj1md2d5PVE0d21tUHlXUVZn
QG1haWwuZ21haWwuY29tIgogICAgICB0eXBlPSJjaXRlIj4KICAgICAgPG1ldGEgaHR0cC1lcXVp
dj0iQ29udGVudC1UeXBlIiBjb250ZW50PSJ0ZXh0L2h0bWw7IGNoYXJzZXQ9dXRmLTgiPgogICAg
ICA8ZGl2IGRpcj0ibHRyIj4KICAgICAgICA8ZGl2IGNsYXNzPSJnbWFpbF9leHRyYSI+PGJyPgog
ICAgICAgICAgPGRpdiBjbGFzcz0iZ21haWxfcXVvdGUiPk9uIDQgSmFudWFyeSAyMDE3IGF0IDEx
OjU4LCBBbWFybmF0aAogICAgICAgICAgICBWYWxsdXJpIDxzcGFuIGRpcj0ibHRyIj4mbHQ7PGEg
bW96LWRvLW5vdC1zZW5kPSJ0cnVlIgogICAgICAgICAgICAgICAgaHJlZj0ibWFpbHRvOmFtYXJu
YXRoLnZhbGx1cmlAaW50ZWwuY29tIiB0YXJnZXQ9Il9ibGFuayI+YW1hcm5hdGgudmFsbHVyaUBp
bnRlbC5jb208L2E+Jmd0Ozwvc3Bhbj4KICAgICAgICAgICAgd3JvdGU6PGJyPgogICAgICAgICAg
ICA8YmxvY2txdW90ZSBjbGFzcz0iZ21haWxfcXVvdGUiIHN0eWxlPSJtYXJnaW46MCAwIDAKICAg
ICAgICAgICAgICAuOGV4O2JvcmRlci1sZWZ0OjFweCAjY2NjIHNvbGlkO3BhZGRpbmctbGVmdDox
ZXgiPgogICAgICAgICAgICAgIDxkaXYgaWQ9Ijo0ZzgiIGNsYXNzPSJhM3MgYVhqQ0ggbTE1OTY5
NTg3ZDNjZTg3NWIiPlVzZQogICAgICAgICAgICAgICAgJHtiYXNlX2xpYmRpcn0vbW9kdWxlcyBp
bnBsYWNlIG9mIC9saWIvbW9kdWxlcyBmb3IKICAgICAgICAgICAgICAgIGtlcm5lbCBtb2R1bGVz
IGluc3RhbGxhdGlvbiBwYXRoLjxicj4KICAgICAgICAgICAgICA8L2Rpdj4KICAgICAgICAgICAg
PC9ibG9ja3F1b3RlPgogICAgICAgICAgPC9kaXY+CiAgICAgICAgICA8YnI+CiAgICAgICAgICBE
b2VzIHRoZSBrZXJuZWwgYWN0dWFsbHkgcmVzcGVjdCAke2Jhc2VfbGliZGlyfT88L2Rpdj4KICAg
ICAgPC9kaXY+CiAgICA8L2Jsb2NrcXVvdGU+CiAgICBZZXMgUm9zcywgS2VybmVsIGFsbG93cyB0
byBhbHRlciBtb2R1bGVzLCBmaXJtd2FyZSBpbnN0YWxsYXRpb24gcGF0aAogICAgdmlhIE1PRExJ
QiBhbmQgSU5TVEFMTF9GV19QQVRIIGVudmlyb25tZW50IHZhcmlhYmxlcy48YnI+CiAgICA8YnI+
CiAgICAtIEFtYXJuYXRoPGJyPgogIDxwPi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLTxicj4KSW50ZWwgRmlubGFuZCBP
eTxicj4KUmVnaXN0ZXJlZCBBZGRyZXNzOiBQTCAyODEsIDAwMTgxIEhlbHNpbmtpIDxicj4KQnVz
aW5lc3MgSWRlbnRpdHkgQ29kZTogMDM1NzYwNiAtIDQgPGJyPgpEb21pY2lsZWQgaW4gSGVsc2lu
a2kgPC9wPgoKPHA+VGhpcyBlLW1haWwgYW5kIGFueSBhdHRhY2htZW50cyBtYXkgY29udGFpbiBj
b25maWRlbnRpYWwgbWF0ZXJpYWwgZm9yPGJyPgp0aGUgc29sZSB1c2Ugb2YgdGhlIGludGVuZGVk
IHJlY2lwaWVudChzKS4gQW55IHJldmlldyBvciBkaXN0cmlidXRpb248YnI+CmJ5IG90aGVycyBp
cyBzdHJpY3RseSBwcm9oaWJpdGVkLiBJZiB5b3UgYXJlIG5vdCB0aGUgaW50ZW5kZWQ8YnI+CnJl
Y2lwaWVudCwgcGxlYXNlIGNvbnRhY3QgdGhlIHNlbmRlciBhbmQgZGVsZXRlIGFsbCBjb3BpZXMu
PC9wPjwvYm9keT4KPC9odG1sPgo=

--------------D317D2E922D0910B827BC581--
