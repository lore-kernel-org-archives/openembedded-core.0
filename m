Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 0434165C90
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Mar 2017 08:50:13 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	10 Mar 2017 00:50:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,139,1486454400"; d="scan'208";a="1120849620"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga001.fm.intel.com with ESMTP; 10 Mar 2017 00:50:14 -0800
To: openembedded-core@lists.openembedded.org
References: <1489117322-17601-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <e896b6c1-ee3c-908a-3db2-1a46fa7ca069@linux.intel.com>
Date: Fri, 10 Mar 2017 10:49:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.6.0
MIME-Version: 1.0
In-Reply-To: <1489117322-17601-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
Subject: Re: [PATCH] rpm: 5.4.16 -> 5.4.17
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
X-List-Received-Date: Fri, 10 Mar 2017 08:50:16 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 03/10/2017 05:42 AM, Zheng Ruoqin wrote:
> 1) Upgrade rpm from 5.4.16 to 5.4.17

Apologies, but this is not anymore necessary. rpm5 will be replaced by 
rpm4 very soon - you are welcome to test it:

https://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=akanavin/dnf-rpm4

Alex


