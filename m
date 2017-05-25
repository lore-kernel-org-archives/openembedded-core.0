Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 6C3FD77FDE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 May 2017 08:13:19 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	25 May 2017 01:13:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,390,1491289200"; d="scan'208";a="91293902"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga004.jf.intel.com with ESMTP; 25 May 2017 01:13:19 -0700
To: Fan Xin <fan.xin@jp.fujitsu.com>, openembedded-core@lists.openembedded.org
References: <1495682095-8382-1-git-send-email-fan.xin@jp.fujitsu.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <574b4724-40f4-9efb-b39b-2424adb13442@linux.intel.com>
Date: Thu, 25 May 2017 11:11:24 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <1495682095-8382-1-git-send-email-fan.xin@jp.fujitsu.com>
Subject: Re: [PATCH] nss: Upgrade 3.29.1 to 3.30.2
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
X-List-Received-Date: Thu, 25 May 2017 08:13:20 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 05/25/2017 06:14 AM, Fan Xin wrote:
> Network Security Services (NSS) 3.30.2 is a patch release for NSS 3.30.
>
> The bug fixes in NSS 3.30.2 are as follows:
>
>     Bug 1350859 - March 2017 batch of root CA changes
>     Bug 1349705 - Implemented domain name constraints for CA

This is the changelog from 3.30.1, and it is not particularly useful 
when the update is from 3.29. You either need to include the full 
changelog from that version, or (better) provide a link to where it can 
be found on the internet. Not including anything into the commit message 
is okay too.


Alex

