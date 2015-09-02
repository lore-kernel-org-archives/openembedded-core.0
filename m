Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id E6B9176FF2
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Sep 2015 15:11:57 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga103.jf.intel.com with ESMTP; 02 Sep 2015 08:11:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,454,1437462000"; d="scan'208";a="553894172"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.143])
	([10.237.68.143])
	by FMSMGA003.fm.intel.com with ESMTP; 02 Sep 2015 08:11:57 -0700
Message-ID: <55E71222.9050409@linux.intel.com>
Date: Wed, 02 Sep 2015 18:13:38 +0300
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.7.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1439804133-27118-1-git-send-email-raj.khem@gmail.com>
In-Reply-To: <1439804133-27118-1-git-send-email-raj.khem@gmail.com>
Subject: Re: [PATCH V2] uclibc: Upgrade to tip of master
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
X-List-Received-Date: Wed, 02 Sep 2015 15:11:59 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08/17/2015 12:35 PM, Khem Raj wrote:
> -SRCREV = "48a0006012679ff0eda6f256da958d73a924fb57"
> +SRCREV = "ca1c74d67dd115d059a875150e10b8560a9c35a8"
>
>   PV = "0.9.33+git${SRCPV}"

The latest upstream release is 0.9.33.2, please update PV.

Regards,
Alex


