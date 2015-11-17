Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id DC45876A98
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Nov 2015 02:08:46 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id tAH28k8g000693
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 16 Nov 2015 18:08:46 -0800 (PST)
Received: from [128.224.162.154] (128.224.162.154) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 16 Nov 2015 18:08:45 -0800
Message-ID: <564A8C2C.7050303@windriver.com>
Date: Tue, 17 Nov 2015 10:08:44 +0800
From: wenzong fan <wenzong.fan@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1447659023.git.wenzong.fan@windriver.com>
	<CAJTo0Lb_4Cyt+40faL1tddvJv5PDiG4cWcN9bjfGsBRU5yfY6Q@mail.gmail.com>
In-Reply-To: <CAJTo0Lb_4Cyt+40faL1tddvJv5PDiG4cWcN9bjfGsBRU5yfY6Q@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/3] qemu: fix CVE-2015-5225, CVE-2015-6855, CVE-2015-7295
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
X-List-Received-Date: Tue, 17 Nov 2015 02:08:47 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 11/16/2015 09:57 PM, Burton, Ross wrote:
>
> On 16 November 2015 at 07:32, <wenzong.fan@windriver.com
> <mailto:wenzong.fan@windriver.com>> wrote:
>
>     Wenzong Fan (3):
>        qemu: fix CVE-2015-5225
>        qemu: fix CVE-2015-6855
>        qemu: fix CVE-2015-7295
>
>
> Master has the 2.4.0.1 upgrade now, can you rebase this series?  At
> least 5225 is fixed there already.

Ok, I'll rebase them.

Thanks
Wenzong

>
> Ross

