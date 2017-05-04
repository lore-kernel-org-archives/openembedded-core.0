Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id A953E71CB8
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 May 2017 10:16:35 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga105.jf.intel.com with ESMTP; 04 May 2017 03:16:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,287,1491289200"; d="scan'208";a="1164472132"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga002.fm.intel.com with ESMTP; 04 May 2017 03:16:35 -0700
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <20170503131153.1780-1-alexander.kanavin@linux.intel.com>
	<2897866.bodmxEm400@peggleto-mobl.ger.corp.intel.com>
	<24ebf3f4-9855-8aea-7019-3951973d37e1@linux.intel.com>
	<2764166.Tu3B0AapLd@peggleto-mobl.ger.corp.intel.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <6447df1b-8742-7451-1978-68527f141437@linux.intel.com>
Date: Thu, 4 May 2017 13:16:36 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <2764166.Tu3B0AapLd@peggleto-mobl.ger.corp.intel.com>
Cc: Leonardo Sandoval <leonardo.sandoval.gonzalez@intel.com>,
	openembedded-core@lists.openembedded.org
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yICJsaWJlcmF0aW9uLWZvbnRzOiB1cGRhdGUgdG8gMi4uLi4iIGFuZCA0IG1vcmU=?=
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
X-List-Received-Date: Thu, 04 May 2017 10:16:35 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 05/04/2017 01:07 PM, Paul Eggleton wrote:
> The original idea was that the tests could also be run from your local machine
> (could easily be as a git hook), and whilst it's not as easy as I might have
> liked it is doable - however even if it were much easier, we have to be
> realistic and acknowledge that most people still won't do it.

I thought default git hooks can be enforced by the remote repo when you 
do a clone, no?


Alex


