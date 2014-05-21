Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (unknown [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 8C8A365D5B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 May 2014 11:57:21 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 21 May 2014 04:52:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.98,879,1392192000"; d="scan'208";a="515386995"
Received: from mmckenna-mobl2.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.123.156])
	by orsmga001.jf.intel.com with ESMTP; 21 May 2014 04:57:10 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Matthieu Crapet <Matthieu.Crapet@ingenico.com>
Date: Wed, 21 May 2014 12:57:09 +0100
Message-ID: <1423131.I8v84STvfF@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.12.5 (Linux/3.14.4-200.fc20.x86_64; KDE/4.12.5; x86_64; ; )
In-Reply-To: <1400672277-7181-4-git-send-email-Matthieu.Crapet@ingenico.com>
References: <1400672277-7181-1-git-send-email-Matthieu.Crapet@ingenico.com>
	<1400672277-7181-4-git-send-email-Matthieu.Crapet@ingenico.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 4/4] libav (9.13): remove DEFAULT_PREFERENCE
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
X-List-Received-Date: Wed, 21 May 2014 11:57:24 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 21 May 2014 13:37:57 Matthieu Crapet wrote:
> Use PREFERRED_VERSION_libav in your distro definition instead.

Why? PREFERRED_VERSION_libav will override this in any case...

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

