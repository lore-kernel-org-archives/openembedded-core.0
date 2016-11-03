Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 201DC71BB8
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Nov 2016 13:34:00 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga104.jf.intel.com with ESMTP; 03 Nov 2016 06:34:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,438,1473145200"; d="scan'208";a="27332919"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga004.jf.intel.com with ESMTP; 03 Nov 2016 06:34:01 -0700
To: openembedded-core@lists.openembedded.org
References: <1478127423-4954-1-git-send-email-armccurdy@gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <3250622d-30f9-80ee-e859-6d132e752642@linux.intel.com>
Date: Thu, 3 Nov 2016 15:31:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <1478127423-4954-1-git-send-email-armccurdy@gmail.com>
Subject: Re: [PATCH] gdb: update 7.11+git1a982b689c -> 7.11.1
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
X-List-Received-Date: Thu, 03 Nov 2016 13:34:01 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 11/03/2016 12:57 AM, Andre McCurdy wrote:
>   41d8236 Set GDB version number to 7.11.1.

Master branch of oe-core should be updated to the latest release of gdb, 
which is 7.12 at the moment. This patch is fine for morty though.

Alex


