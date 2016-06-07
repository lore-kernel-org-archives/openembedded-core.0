Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 5419F7318D
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Jun 2016 12:12:39 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP; 07 Jun 2016 05:12:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,432,1459839600"; d="scan'208";a="992670687"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga002.jf.intel.com with ESMTP; 07 Jun 2016 05:12:40 -0700
Received: by linux.intel.com (Postfix, from userid 48)
	id D70DC6A4008; Tue,  7 Jun 2016 06:00:07 -0700 (PDT)
Received: from 10.252.15.9 (SquirrelMail authenticated user alexander.kanavin)
	by linux.intel.com with HTTP; Tue, 7 Jun 2016 16:00:07 +0300 (EEST)
Message-ID: <51472.10.252.15.9.1465304407.squirrel@linux.intel.com>
In-Reply-To: <32a173b655f72d7fa125f2207dfb8be29029fc3a.1465288175.git.jussi.kukkone
	n@intel.com>
References: <cover.1465288174.git.jussi.kukkonen@intel.com>
	<32a173b655f72d7fa125f2207dfb8be29029fc3a.1465288175.git.jussi.kukkonen@intel.com>
Date: Tue, 7 Jun 2016 16:00:07 +0300 (EEST)
From: alexander.kanavin@linux.intel.com
To: "Jussi Kukkonen" <jussi.kukkonen@intel.com>
User-Agent: SquirrelMail/1.4.8-5.el4.centos.8
MIME-Version: 1.0
X-Priority: 3 (Normal)
Importance: Normal
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 12/37] connman-gnome: Add patch to port to Gtk+3
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
X-List-Received-Date: Tue, 07 Jun 2016 12:12:40 -0000
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: 8bit

> Upstream is not really active anymore: patch the Gtk+3 upgrade
> in for now (long term solution is to change to another UI).

This should be squashed with 08/37.

Alex


