Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id F131474242
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Sep 2015 12:13:09 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga102.jf.intel.com with ESMTP; 04 Sep 2015 05:13:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,469,1437462000"; d="scan'208";a="638472133"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga003.jf.intel.com with ESMTP; 04 Sep 2015 05:13:08 -0700
Message-ID: <55E98B3B.4050704@linux.intel.com>
Date: Fri, 04 Sep 2015 15:14:51 +0300
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.7.0
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <cover.1441293149.git.alexander.kanavin@linux.intel.com>
	<cover.1441293149.git.alexander.kanavin@linux.intel.com>
	<f5f4a16fdb097b19fb45e9f667f59f99e9f04ef5.1441293149.git.alexander.kanavin@linux.intel.com>
	<B9C7EAB1-4025-474E-8FBB-7DF1BE6C5706@gmail.com>
In-Reply-To: <B9C7EAB1-4025-474E-8FBB-7DF1BE6C5706@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 04/12] gnome-icon-theme: remove the recipe
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
X-List-Received-Date: Fri, 04 Sep 2015 12:13:11 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 09/04/2015 12:28 AM, Khem Raj wrote:

>> It is not used by anything in oe-core and will be moved to meta-gnome
>>
>
> OK, please send the patch for meta-gnome as well. So we can merge them in more or less in sync

I will send these patches only when oe-core is updated. Recipe moving is 
always controversial, and I don't want to cause confusion when the 
change is accepted by one side and rejected by the other.

Alex


