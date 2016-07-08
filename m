Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 7B26B60119
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jul 2016 13:50:13 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga103.jf.intel.com with ESMTP; 08 Jul 2016 06:50:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,330,1464678000"; d="scan'208";a="135927671"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga004.fm.intel.com with ESMTP; 08 Jul 2016 06:50:13 -0700
To: openembedded-core@lists.openembedded.org
References: <cover.1467914773.git.raj.khem@gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <cee6d405-3fdf-157b-967b-91022d5e9b9c@linux.intel.com>
Date: Fri, 8 Jul 2016 16:50:22 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.1.0
MIME-Version: 1.0
In-Reply-To: <cover.1467914773.git.raj.khem@gmail.com>
Subject: Re: [PATCH 0/4] musl/glibc/binutils updates
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
X-List-Received-Date: Fri, 08 Jul 2016 13:50:17 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 07/07/2016 09:08 PM, Khem Raj wrote:
> Fix gcc5 hang in SDK with -mmusl
> Update musl to 1.1.15 release
> Update binutils to 2.26.1
> Update glibc to latest on 2.24 freeze tree

What about uclibc? It should be updated as well.

Alex


