Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 3B1D4601DF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 May 2015 02:28:42 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t4J2SgIb022337
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 18 May 2015 19:28:42 -0700 (PDT)
Received: from [128.224.163.140] (128.224.163.140) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 18 May 2015 19:28:42 -0700
Message-ID: <555A9FD8.8070607@windriver.com>
Date: Tue, 19 May 2015 10:28:40 +0800
From: wenzong fan <wenzong.fan@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>, "Shiqun.Lin"
	<Shiqun.Lin@windriver.com>
References: <547FC6F9.3050609@windriver.com>
	<CAJTo0LY-Ne=J0NAUFO5E+mp6rVj=Zptq7aXnqPeJJ9x-2Ef3Ng@mail.gmail.com>
In-Reply-To: <CAJTo0LY-Ne=J0NAUFO5E+mp6rVj=Zptq7aXnqPeJJ9x-2Ef3Ng@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] improve the sanity check for PATH and BBPATH
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
X-List-Received-Date: Tue, 19 May 2015 02:28:44 -0000
X-Groupsio-MsgNum: 65694
Content-Type: multipart/mixed; boundary="------------040900090903040006090702"

--------------040900090903040006090702
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

Hi Ross,

Please refer to attachment for the rebased patch.

Thanks
Wenzong

On 12/05/2014 01:28 AM, Burton, Ross wrote:
> This doesn't apply to master, can you rebase?
>
> Ross
>
> On 4 December 2014 at 02:29, Shiqun.Lin <Shiqun.Lin@windriver.com
> <mailto:Shiqun.Lin@windriver.com>> wrote:
>
>
>
>     --
>     _______________________________________________
>     Openembedded-core mailing list
>     Openembedded-core@lists.openembedded.org
>     <mailto:Openembedded-core@lists.openembedded.org>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>
>
>

--------------040900090903040006090702
Content-Type: application/mbox;
	name="0001-sanity.bbclass-improve-the-sanity-check-for-PATH-and.patch"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
	filename*0="0001-sanity.bbclass-improve-the-sanity-check-for-PATH-and.pa";
	filename*1="tch"

RnJvbSAyMWQ5NGM4ZWE2NDg2NTA2NTM2MzY2MTA3NjVkZDc4YmU5NzBiMmVlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBTaGlxdW4gTGluIDxTaGlxdW4uTGluQHdpbmRyaXZlci5jb20+
CkRhdGU6IFdlZCwgNyBKYW4gMjAxNSAxNTowMDozMSArMDgwMApTdWJqZWN0OiBbUEFUQ0hdIHNh
bml0eS5iYmNsYXNzOiBpbXByb3ZlIHRoZSBzYW5pdHkgY2hlY2sgZm9yIFBBVEggYW5kIEJCUEFU
SAoKQnVpbGQgZmFpbHMgaWYgIi4vIiBpcyBpbiB0aGUgUEFUSAoKVG8gcmVwcm9kdWNlIHRoZSBp
c3N1ZToKCiAgJCBleHBvcnQgUEFUSD0iLi86JFBBVEgiCiAgJCBtYWtlIC1DIGJ1aWxkLXRvb2xz
IGVsZnV0aWxzCgogIEVycm9yOiAuL2xkOiB1bnJlY29nbml6ZWQgb3B0aW9uICctLXN5c3Jvb3Q9
LycKClNpZ25lZC1vZmYtYnk6IFNoaXF1biBMaW4gPFNoaXF1bi5MaW5Ad2luZHJpdmVyLmNvbT4K
LS0tCiBtZXRhL2NsYXNzZXMvc2FuaXR5LmJiY2xhc3MgfCA4ICsrKystLS0tCiAxIGZpbGUgY2hh
bmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL21ldGEv
Y2xhc3Nlcy9zYW5pdHkuYmJjbGFzcyBiL21ldGEvY2xhc3Nlcy9zYW5pdHkuYmJjbGFzcwppbmRl
eCBmYzhjOTgwLi5lNzM4MTEwIDEwMDY0NAotLS0gYS9tZXRhL2NsYXNzZXMvc2FuaXR5LmJiY2xh
c3MKKysrIGIvbWV0YS9jbGFzc2VzL3Nhbml0eS5iYmNsYXNzCkBAIC02NTMsOSArNjUzLDkgQEAg
ZGVmIGNoZWNrX3Nhbml0eV92ZXJzaW9uX2NoYW5nZShzdGF0dXMsIGQpOgogICAgICAgICAgICAg
c3RhdHVzLmFkZHJlc3VsdCgiWW91IGhhdmUgYSAzMi1iaXQgbGliYywgYnV0IG5vIDMyLWJpdCBo
ZWFkZXJzLiAgWW91IG11c3QgaW5zdGFsbCB0aGUgMzItYml0IGxpYmMgaGVhZGVycy5cbiIpCiAK
ICAgICBiYnBhdGhzID0gZC5nZXRWYXIoJ0JCUEFUSCcsIFRydWUpLnNwbGl0KCI6IikKLSAgICBp
ZiAoIi4iIGluIGJicGF0aHMgb3IgIiIgaW4gYmJwYXRocykgYW5kIG5vdCBzdGF0dXMucmVwYXJz
ZToKKyAgICBpZiAoIi4iIGluIGJicGF0aHMgb3IgIi4vIiBpbiBiYnBhdGhzIG9yICIiIGluIGJi
cGF0aHMpIGFuZCBub3Qgc3RhdHVzLnJlcGFyc2U6CiAgICAgICAgIHN0YXR1cy5hZGRyZXN1bHQo
IkJCUEFUSCByZWZlcmVuY2VzIHRoZSBjdXJyZW50IGRpcmVjdG9yeSwgZWl0aGVyIHRocm91Z2gg
IiAgICBcCi0gICAgICAgICAgICAgICAgImFuIGVtcHR5IGVudHJ5LCBvciBhICcuJy5cblx0IFRo
aXMgaXMgdW5zYWZlIGFuZCBtZWFucyB5b3VyICJcCisgICAgICAgICAgICAgICAgImFuIGVtcHR5
IGVudHJ5LCBhICcuLycgb3IgYSAnLicuXG5cdCBUaGlzIGlzIHVuc2FmZSBhbmQgbWVhbnMgeW91
ciAiXAogICAgICAgICAgICAgICAgICJsYXllciBjb25maWd1cmF0aW9uIGlzIGFkZGluZyBlbXB0
eSBlbGVtZW50cyB0byBCQlBBVEguXG5cdCAiXAogICAgICAgICAgICAgICAgICJQbGVhc2UgY2hl
Y2sgeW91ciBsYXllci5jb25mIGZpbGVzIGFuZCBvdGhlciBCQlBBVEggIiAgICAgICAgXAogICAg
ICAgICAgICAgICAgICJzZXR0aW5ncyB0byByZW1vdmUgdGhlIGN1cnJlbnQgd29ya2luZyBkaXJl
Y3RvcnkgIiAgICAgICAgICAgXApAQCAtNjkzLDggKzY5Myw4IEBAIGRlZiBjaGVja19zYW5pdHlf
ZXZlcnlidWlsZChzdGF0dXMsIGQpOgogICAgIHNhbml0eV9jaGVja19jb25mZmlsZXMoc3RhdHVz
LCBkKQogCiAgICAgcGF0aHMgPSBkLmdldFZhcignUEFUSCcsIFRydWUpLnNwbGl0KCI6IikKLSAg
ICBpZiAiLiIgaW4gcGF0aHMgb3IgIiIgaW4gcGF0aHM6Ci0gICAgICAgIHN0YXR1cy5hZGRyZXN1
bHQoIlBBVEggY29udGFpbnMgJy4nIG9yICcnIChlbXB0eSBlbGVtZW50KSwgd2hpY2ggd2lsbCBi
cmVhayB0aGUgYnVpbGQsIHBsZWFzZSByZW1vdmUgdGhpcy5cblBhcnNlZCBQQVRIIGlzICIgKyBz
dHIocGF0aHMpICsgIlxuIikKKyAgICBpZiAiLiIgaW4gcGF0aHMgb3IgIi4vIiBpbiBwYXRocyBv
ciAiIiBpbiBwYXRoczoKKyAgICAgICAgc3RhdHVzLmFkZHJlc3VsdCgiUEFUSCBjb250YWlucyAn
LicsICcuLycgb3IgJycgKGVtcHR5IGVsZW1lbnQpLCB3aGljaCB3aWxsIGJyZWFrIHRoZSBidWls
ZCwgcGxlYXNlIHJlbW92ZSB0aGlzLlxuUGFyc2VkIFBBVEggaXMgIiArIHN0cihwYXRocykgKyAi
XG4iKQogCiAgICAgIyBDaGVjayB0aGF0IHRoZSBESVNUUk8gaXMgdmFsaWQsIGlmIHNldAogICAg
ICMgbmVlZCB0byB0YWtlIGludG8gYWNjb3VudCBESVNUUk8gcmVuYW1pbmcgRElTVFJPCi0tIAox
LjkuMQoK

--------------040900090903040006090702--
