Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 5F34677328
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Feb 2017 11:54:32 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga105.fm.intel.com with ESMTP; 10 Feb 2017 03:54:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,141,1484035200"; d="scan'208";a="1124754962"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga002.fm.intel.com with ESMTP; 10 Feb 2017 03:54:32 -0800
To: openembedded-core@lists.openembedded.org
References: <cover.1486668313.git.jussi.kukkonen@intel.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <f9a4abbc-498f-ce04-f9c4-c2c08e9b8be1@linux.intel.com>
Date: Fri, 10 Feb 2017 13:55:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.6.0
MIME-Version: 1.0
In-Reply-To: <cover.1486668313.git.jussi.kukkonen@intel.com>
Subject: Re: [PATCH 0/3] Fix cve-check (for recipe sysroots)
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
X-List-Received-Date: Fri, 10 Feb 2017 11:54:33 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 02/09/2017 09:38 PM, Jussi Kukkonen wrote:

> I mentioned error output improvements in email  but did not implement
> as that requires more upstream changes: I'll talk to the maintainer
> about them.

Isn't it so that the upstream maintainer has abandoned this tool (and 
the Big Rewrite of it too)? Then we need to find an alternative 
approach, or roll our own.

Alex


