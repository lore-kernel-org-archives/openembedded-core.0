Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 7AA8A78496
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Sep 2017 15:11:20 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v81FBLR8002362
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 1 Sep 2017 08:11:22 -0700 (PDT)
Received: from [172.25.44.7] (172.25.44.7) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Fri, 1 Sep 2017 08:11:20 -0700
To: "Burton, Ross" <ross.burton@intel.com>, OE-core
	<openembedded-core@lists.openembedded.org>
References: <20170831122335.6864-1-clopez@igalia.com>
	<CAJTo0LZTdWS=haawEyk_k2cq=5DKqPM=4s_JS0RyWxyw7epMVA@mail.gmail.com>
	<ddf815cf-b746-7107-ba7e-9e41ab8747ec@igalia.com>
	<CAJTo0LbsBGGCqksh5RcM48q-sNMWg42o+3iM=OjnR5dya1mXRw@mail.gmail.com>
	<a97b1a6b-c037-e7ad-4e6a-f770439b7ff5@igalia.com>
	<CAJTo0LaZFrAcsvMf5CHK6QmeNEnxQaJXy7ho7hK=hCvLxc0_-g@mail.gmail.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <d8733ca3-1c0c-72cc-1250-2639d0d951bf@windriver.com>
Date: Fri, 1 Sep 2017 11:11:18 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <CAJTo0LaZFrAcsvMf5CHK6QmeNEnxQaJXy7ho7hK=hCvLxc0_-g@mail.gmail.com>
X-Originating-IP: [172.25.44.7]
Subject: Re: [PATCH] initramfs-live-boot: disable systemd-update-done.service on live images
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
X-List-Received-Date: Fri, 01 Sep 2017 15:11:21 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 2017-08-31 01:00 PM, Burton, Ross wrote:
> On 31 August 2017 at 17:57, Carlos Alberto Lopez Perez 
> <clopez@igalia.com <mailto:clopez@igalia.com>> wrote:
> 
>     Better done than promised! :)
>     https://github.com/systemd/systemd/issues/6716
>     <https://github.com/systemd/systemd/issues/6716>
> 
> 
> And staged :)
> 
> Ross
> 
> 
and closed by Mr Poettering as "Not a bug" :-/

-- 
# Randy MacLeod.  WR Linux
# Wind River an Intel Company

