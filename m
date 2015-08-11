Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id B1CAB76477
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Aug 2015 16:48:34 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga102.fm.intel.com with ESMTP; 11 Aug 2015 09:48:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,654,1432623600"; d="scan'208";a="782066107"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.143])
	([10.237.68.143])
	by orsmga002.jf.intel.com with ESMTP; 11 Aug 2015 09:48:34 -0700
Message-ID: <55CA27AD.6080204@linux.intel.com>
Date: Tue, 11 Aug 2015 19:49:49 +0300
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.7.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1439311301-18243-1-git-send-email-anibal.limon@linux.intel.com>
In-Reply-To: <1439311301-18243-1-git-send-email-anibal.limon@linux.intel.com>
Subject: Re: [PATCH 1/2] distrodata: Make self-contained.
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
X-List-Received-Date: Tue, 11 Aug 2015 16:48:37 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On 08/11/2015 07:41 PM, Aníbal Limón wrote:
> Include by default all the files needed to perform checkpkg task.
>
> These files are copied from meta-yocto because they refers recipes in
> oe-core, the only missing file are maintainers.inc because it needs
> consensus between OE-Core and Yocto project to define a common set of
> maintainers.

Is there a PATCH 2/2?


Alex


