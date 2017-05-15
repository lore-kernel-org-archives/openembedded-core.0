Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id E824371CA7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 May 2017 10:52:04 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	15 May 2017 03:52:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,344,1491289200"; d="scan'208";a="1169325085"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga002.fm.intel.com with ESMTP; 15 May 2017 03:52:04 -0700
To: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>,
	openembedded-core@lists.openembedded.org
References: <1494607799-32105-1-git-send-email-anibal.limon@linux.intel.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <5247c79d-2131-0bff-8970-4c4bcef387a0@linux.intel.com>
Date: Mon, 15 May 2017 13:49:58 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <1494607799-32105-1-git-send-email-anibal.limon@linux.intel.com>
Subject: Re: [PATCH] qemu: Upgrade to 2.8.1.1
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
X-List-Received-Date: Mon, 15 May 2017 10:52:07 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On 05/12/2017 07:49 PM, Aníbal Limón wrote:
> Removed patch target-ppc-fix-user-mode.patch [1] already on
> upstream.
>
> [1] http://git.qemu.org/?p=qemu.git;a=history;f=linux-user/main.c;
> h=65a769cf797254a86a7cf589d69e67595a9e1adb;hb=refs/heads/stable-2.8
>
> Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>

Upstream is already at 2.9, why this version?

Alex


