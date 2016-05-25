Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id B309060796
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 May 2016 12:59:55 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 25 May 2016 05:59:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,364,1459839600"; d="scan'208";a="974248123"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga001.fm.intel.com with ESMTP; 25 May 2016 05:59:56 -0700
Received: by linux.intel.com (Postfix, from userid 48)
	id ADF6C6A4008; Wed, 25 May 2016 06:47:26 -0700 (PDT)
Received: from 10.252.8.31 (SquirrelMail authenticated user alexander.kanavin)
	by linux.intel.com with HTTP; Wed, 25 May 2016 16:47:26 +0300 (EEST)
Message-ID: <51439.10.252.8.31.1464184046.squirrel@linux.intel.com>
In-Reply-To: <51113.10.252.8.31.1464181299.squirrel@linux.intel.com>
References: <cover.1464088997.git.alexander.kanavin@linux.intel.com>
	<e0ab0ad1-fb6d-a8a0-a31f-913b9fa4dcc2@windriver.com>
	<51113.10.252.8.31.1464181299.squirrel@linux.intel.com>
Date: Wed, 25 May 2016 16:47:26 +0300 (EEST)
From: alexander.kanavin@linux.intel.com
To: alexander.kanavin@linux.intel.com
User-Agent: SquirrelMail/1.4.8-5.el4.centos.8
MIME-Version: 1.0
X-Priority: 3 (Normal)
Importance: Normal
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 00/45] Move recipes to use Python 3 whenever possible
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
X-List-Received-Date: Wed, 25 May 2016 12:59:57 -0000
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: 8bit

>> Please create one (or three) defects and assign them to me for smartpm,
>> createrepo, and rpm python3 support.  (I doubt I'll be the one doing the
>> work,
>> but I'll do my best to find someone to do the work.)
>
> Yes, I'll do that now.

Filed at https://bugzilla.yoctoproject.org/show_bug.cgi?id=9675

Alex

