Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id F19BB72FE7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Feb 2017 14:46:40 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	27 Feb 2017 06:46:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,215,1484035200"; d="scan'208";a="53451153"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga002.jf.intel.com with ESMTP; 27 Feb 2017 06:46:40 -0800
To: openembedded-core@lists.openembedded.org
References: <1488204355-15461-1-git-send-email-peter.marko@siemens.com>
	<CAJTo0LY7YEy_-EVroSHcMf-C-x7ZhNMXCZQD4m9Wxa7xbp3z8w@mail.gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <3bcbf98c-f635-26e3-880b-9f5af90386ef@linux.intel.com>
Date: Mon, 27 Feb 2017 16:45:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.6.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LY7YEy_-EVroSHcMf-C-x7ZhNMXCZQD4m9Wxa7xbp3z8w@mail.gmail.com>
Subject: Re: [PATCH] zlib: Upgrade 1.2.8 -> 1.2.11
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
X-List-Received-Date: Mon, 27 Feb 2017 14:46:43 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 02/27/2017 04:41 PM, Burton, Ross wrote:
> vvvvvvvvvvvvvvvvvvvvvvvvvvvv beginline=4 vvvvvvvvvvvvvvvvvvvvvvvvvvvvv
>   Copyright (C) 1995-2017 Jean-loup Gailly and Mark Adler
....
> ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ endline=23 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> zlib: Check if the license information has changed in
> /data/poky-master/tmp/work/corei7-64-poky-linux/zlib/1.2.11-r0/zlib-1.2.11/zlib.h
> (lines 4 through to 23) to verify that the LICENSE value "Zlib" remains
> valid [license-checksum]

It's probably just the year changing to 2017, in which case the 
beginline can be changed to 5.

Alex


