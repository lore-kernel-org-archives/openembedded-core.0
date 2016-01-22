Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 7B741731C4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jan 2016 18:22:35 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 22 Jan 2016 10:22:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,332,1449561600"; d="scan'208";a="887136932"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga001.fm.intel.com with ESMTP; 22 Jan 2016 10:22:35 -0800
Received: by linux.intel.com (Postfix, from userid 48)
	id 44CBA6A4006; Fri, 22 Jan 2016 11:10:31 -0800 (PST)
Received: from 10.252.10.201
	(SquirrelMail authenticated user alexander.kanavin)
	by linux.intel.com with HTTP; Fri, 22 Jan 2016 21:10:31 +0200 (EET)
Message-ID: <61461.10.252.10.201.1453489831.squirrel@linux.intel.com>
In-Reply-To: <56A26F89.8080505@opendreambox.org>
References: <56A22767.7050000@linux.intel.com>
	<56A24CE8.8010501@opendreambox.org>
	<CAJTo0LaAY=Bru-JzaNMQe5KNuAH3+A0VW_mQ6sNy4GvDU7nk6w@mail.gmail.com>
	<56A26F89.8080505@opendreambox.org>
Date: Fri, 22 Jan 2016 21:10:31 +0200 (EET)
From: alexander.kanavin@linux.intel.com
To: "Andreas Oberritter" <obi@opendreambox.org>
User-Agent: SquirrelMail/1.4.8-5.el4.centos.8
MIME-Version: 1.0
X-Priority: 3 (Normal)
Importance: Normal
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: proposal: remove DirectFB from oe-core in the next release cycle
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
X-List-Received-Date: Fri, 22 Jan 2016 18:22:35 -0000
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: 8bit

>> I guess the thing missing is an indication that the repo on github is
>> official and maintained.  Specifically the deniskropp repo has been
>> recently touched but you have to admit
>> that https://github.com/DirectFB/directfb looks more official.
>
> Denis Oliver Kropp is the main developer of DirectFB and the description
> of https://github.com/deniskropp/DirectFB says "Official DirectFB GitHub
> Repository".

Why did he make a new account on github then? Commits to the old directfb
repo were done from a different account (https://github.com/dfbdok). Also,
there has been no activity whatsoever since October, and no announcement
anywhere, and no response to my request or the other open issue in that
repo. I wouldn't trust that directfb is still alive; we need to wait and
see.

To me, it looks likely that the funding was cut, Denis Kropp has tried to
keep the project alive but then just abandoned it.

Alex

