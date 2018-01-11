Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 29E9F77E9C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jan 2018 15:44:51 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	11 Jan 2018 07:44:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,345,1511856000"; 
   d="scan'208";a="9993728"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga008.jf.intel.com with ESMTP; 11 Jan 2018 07:44:51 -0800
To: "Burton, Ross" <ross.burton@intel.com>
References: <20180111151834.4169-1-ross.burton@intel.com>
	<ca739de3-59f6-e215-8ea5-8cbaf785cf18@linux.intel.com>
	<CAJTo0LbQ3_XRqR=766aptjnT43-cyRfYVE-49OzAw3B3WDRfoA@mail.gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <7c3b43df-a3c0-753b-11a3-12d66d387d28@linux.intel.com>
Date: Thu, 11 Jan 2018 17:45:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LbQ3_XRqR=766aptjnT43-cyRfYVE-49OzAw3B3WDRfoA@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] image: use du --apparent-size when calculating rootfs size
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
X-List-Received-Date: Thu, 11 Jan 2018 15:44:52 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 01/11/2018 05:42 PM, Burton, Ross wrote:

>     Exactly same patch from Maxin caused failures previously, no?
> 
> 
> Hm, I knew I remembered seeing this before, and found my patches from 
> 2015, but didn't see the ones from Maxin.  I'll dig the archives again.

http://lists.openembedded.org/pipermail/openembedded-core/2017-November/144748.html

You're welcome :)

Alex

