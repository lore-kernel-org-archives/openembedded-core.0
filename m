Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E8FEC7318D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Sep 2016 19:08:28 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u8FJ8Rh7025031
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 15 Sep 2016 12:08:28 -0700 (PDT)
Received: from [172.25.44.6] (172.25.44.6) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 15 Sep 2016 12:08:26 -0700
To: "Bystricky, Juro" <juro.bystricky@intel.com>, Seebs <seebs@seebs.net>,
	"Fan, Wenzong (Wind River)" <wenzong.fan@windriver.com>
References: <e33a2d23-6067-cf14-57ab-d40623a3597a@windriver.com>
	<1A4DD5F0-D89E-4FC1-820A-457817B4FCD3@seebs.net>
	<b59ea47c-1b82-c480-5d9f-7dfb8051f83a@windriver.com>
	<BDCB4B3D-E034-4AFD-915C-8DDE5B66D76D@seebs.net>
	<c4af9282-ed95-b7fc-f263-4a66eccfa4bf@windriver.com>
	<9478781A-C1DD-46F5-B447-04D324E9EBA6@seebs.net>
	<6E51916E4A1F32428260031F4C7CD2B61188FFD1@ORSMSX112.amr.corp.intel.com>
	<749c93dd-be45-76d7-921e-f8efd37223bd@windriver.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <37758565-4fd1-ced6-4f9a-3822d3ddc551@windriver.com>
Date: Thu, 15 Sep 2016 15:08:25 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <749c93dd-be45-76d7-921e-f8efd37223bd@windriver.com>
X-Originating-IP: [172.25.44.6]
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: pseudo 1.8.1 doesn't work with docker & dumb-init
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
X-List-Received-Date: Thu, 15 Sep 2016 19:08:30 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 2016-09-14 10:24 PM, Randy MacLeod wrote:
> I'll see if I can reproduce
> the failure overnight.

The laptop build worked without error. I may try again tonight.

-- 
# Randy MacLeod. SMTS, Linux, Wind River
Direct: 613.963.1350 | 350 Terry Fox Drive, Suite 200, Ottawa, ON, 
Canada, K2K 2W5

