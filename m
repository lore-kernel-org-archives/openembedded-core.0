Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 75E196FFAB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jan 2016 12:48:12 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga101.jf.intel.com with ESMTP; 14 Jan 2016 04:48:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,294,1449561600"; d="scan'208";a="893085073"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga002.fm.intel.com with ESMTP; 14 Jan 2016 04:48:12 -0800
To: openembedded-core@lists.openembedded.org
References: <1452754378-2096-1-git-send-email-tanuk@iki.fi>
	<5697824A.8040503@linux.intel.com> <1452774089.11077.100.camel@iki.fi>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <5697986A.7010603@linux.intel.com>
Date: Thu, 14 Jan 2016 14:45:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Icedove/38.5.0
MIME-Version: 1.0
In-Reply-To: <1452774089.11077.100.camel@iki.fi>
Subject: Re: [PATCH] alsa-lib: 1.0.29 -> 1.1.0
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
X-List-Received-Date: Thu, 14 Jan 2016 12:48:14 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01/14/2016 02:21 PM, Tanu Kaskinen wrote:
>>> Changelog: http://alsa-project.org/main/index.php/Changes_v1.0.29_v
>>> 1.1.0
>>
>> What about all the other alsa-* recipes?
>
> They are coming.

It's more convenient if you send them in a single batch, with a branch 
to pull from (using scripts/(create|send)-pull-request). Less manual 
cherry-picking in the email client for Ross.

Alex


