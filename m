Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 35DA877F76
	for <openembedded-core@lists.openembedded.org>;
	Sat, 17 Feb 2018 14:44:59 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	17 Feb 2018 06:45:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,525,1511856000"; d="scan'208";a="201891203"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga005.jf.intel.com with ESMTP; 17 Feb 2018 06:44:59 -0800
To: Ross Burton <ross.burton@intel.com>,
	openembedded-core@lists.openembedded.org
References: <20180208230914.19368-1-ross.burton@intel.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <e00b10c7-fb10-ecb1-920a-a44219a840c8@linux.intel.com>
Date: Sat, 17 Feb 2018 16:38:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180208230914.19368-1-ross.burton@intel.com>
Subject: Re: [PATCH] cve-check: put log in T so it doesn't get deleted by rm_work
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
X-List-Received-Date: Sat, 17 Feb 2018 14:45:00 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 02/09/2018 01:09 AM, Ross Burton wrote:
> This is where the other task logs go, so it's a sensible place to put it.

There is a bunch of other cve-check related commits in master now that 
were never posted here, why is that?

Alex

