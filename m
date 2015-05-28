Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 4468A75669
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 May 2015 13:13:04 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 28 May 2015 06:12:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,513,1427785200"; d="scan'208";a="736738010"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.72.87])
	([10.237.72.87])
	by orsmga002.jf.intel.com with ESMTP; 28 May 2015 06:12:51 -0700
Message-ID: <5566B1D5.9020800@linux.intel.com>
Date: Thu, 28 May 2015 09:12:37 +0300
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.7.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1432775689.git.kai.kang@windriver.com>
	<0bbc0582db36c1fc63650e96b3eaef3561dd7494.1432775689.git.kai.kang@windriver.com>
In-Reply-To: <0bbc0582db36c1fc63650e96b3eaef3561dd7494.1432775689.git.kai.kang@windriver.com>
Subject: Re: [PATCH 3/5] qt4: fix CVE issues
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
X-List-Received-Date: Thu, 28 May 2015 13:13:08 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 05/28/2015 04:26 AM, Kai Kang wrote:
> Backport patches to fix qt4 CVE issues:
>
> * CVE-2015-1858
> * CVE-2015-1859
> * CVE-2015-1860

Qt 4.8.7 is out and (I presume) it has all of those fixes. Why not 
update to that version instead?


Alex


