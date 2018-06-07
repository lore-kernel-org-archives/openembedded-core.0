Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 2CEAD7868B
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Jun 2018 13:25:59 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	07 Jun 2018 06:26:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.49,486,1520924400"; d="scan'208";a="235213678"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga005.fm.intel.com with ESMTP; 07 Jun 2018 06:26:00 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: Andrej Valek <andrej.valek@siemens.com>,
	openembedded-core@lists.openembedded.org
References: <20180607072501.27158-1-andrej.valek@siemens.com>
	<20180607073209.27240-1-andrej.valek@siemens.com>
	<59452b23-7470-588c-75fb-7445aaa13ba1@linux.intel.com>
Message-ID: <508f1fa8-bf75-799a-c135-292f37eca476@linux.intel.com>
Date: Thu, 7 Jun 2018 16:26:22 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <59452b23-7470-588c-75fb-7445aaa13ba1@linux.intel.com>
Subject: Re: [PATCH v2] feat(openssl-1.1): rework packaging
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
X-List-Received-Date: Thu, 07 Jun 2018 13:26:00 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 06/07/2018 04:13 PM, Alexander Kanavin wrote:
> Please explain this change as well. Resend the patch with the 
> explanations included in the commit log or (better), the recipe itself.
> 
> I would like to keep the new openssl recipe short and simple, and so 
> anything that adds lines and complication should be well justified. :)

Oh, one more thing: I am maintaining a branch for the upcoming 1.1.1 
release here:
http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=akanavin/openssl-1.1.1


so if you can give that a test, would be appreciated.

Alex

