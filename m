Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id F20E07890D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Mar 2018 09:01:34 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	19 Mar 2018 02:01:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,329,1517904000"; d="scan'208";a="36179335"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga003.jf.intel.com with ESMTP; 19 Mar 2018 02:01:34 -0700
To: Bruce Ashfield <bruce.ashfield@windriver.com>
References: <20180317204657.19574440002@auh.yoctoproject.org>
	<f2d0bd91-81f9-ff08-2f0d-944e7eafa9c7@windriver.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <73f87883-dc58-4fcf-abf5-840c75086d62@linux.intel.com>
Date: Mon, 19 Mar 2018 10:54:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <f2d0bd91-81f9-ff08-2f0d-944e7eafa9c7@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [AUH] linux-yocto: upgrading to 4.15.7 FAILED
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
X-List-Received-Date: Mon, 19 Mar 2018 09:01:35 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 03/17/2018 11:32 PM, Bruce Ashfield wrote:
> How do I get linux-libc-headers and linux-yocto removed from the
> AUH list of recipes ?
> 
> These follow a specific cadence, and shouldn't be included in these
> attempts.

You ask me to blacklist them. Which I've just done :)

Alex


