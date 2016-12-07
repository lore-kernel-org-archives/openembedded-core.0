Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 4312F60620
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Dec 2016 12:44:41 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga101.fm.intel.com with ESMTP; 07 Dec 2016 04:44:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,310,1477983600"; d="scan'208";a="37876882"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga004.jf.intel.com with ESMTP; 07 Dec 2016 04:44:34 -0800
To: openembedded-core@lists.openembedded.org
References: <1481065505-49663-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <583421ae-36f9-d47e-6037-543d2b08f58a@linux.intel.com>
Date: Wed, 7 Dec 2016 14:44:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <1481065505-49663-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
Subject: Re: [PATCH] less: 481 -> 487
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
X-List-Received-Date: Wed, 07 Dec 2016 12:44:42 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 12/07/2016 01:05 AM, Huang Qiyu wrote:

>  LICENSE = "GPLv3+ | BSD-2-Clause"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
> -                    file://LICENSE;md5=48c26a307f91af700e1f00585f215aaf"
> +                    file://LICENSE;md5=2ef3e4b8dafc85612bc5254b8081e234"

Why did the LICENSE change? You should explain this in the commit message.

Alex


