Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 456B171AC3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Nov 2016 14:01:01 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP; 29 Nov 2016 06:01:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,717,1473145200"; d="scan'208";a="11039421"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga002.jf.intel.com with ESMTP; 29 Nov 2016 06:01:01 -0800
To: Khem Raj <raj.khem@gmail.com>
References: <cover.1480333940.git.alexander.kanavin@linux.intel.com>
	<cover.1480333940.git.alexander.kanavin@linux.intel.com>
	<25f83a1bf177dde8db32ac494b4f0a82839ffb43.1480333940.git.alexander.kanavin@linux.intel.com>
	<57D1D0A9-6C79-4556-A863-A6553364746E@gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <0fb9060b-1019-fb87-3559-ffe8eb46efc7@linux.intel.com>
Date: Tue, 29 Nov 2016 16:01:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <57D1D0A9-6C79-4556-A863-A6553364746E@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 06/18] cmake: update to 3.7.0
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
X-List-Received-Date: Tue, 29 Nov 2016 14:01:02 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 11/29/2016 01:24 AM, Khem Raj wrote:
>
>> On Nov 28, 2016, at 5:34 AM, Alexander Kanavin <alexander.kanavin@linux.intel.com> wrote:
>>
>> License is still 3-clause BSD.
>
> OK. what triggered the checksum change then ?

They added a contributor list to Copyright.txt (I'll trim the lines that 
are checksummed if that list will be constantly changing), and changed 
the header in cmake.h from

/*============================================================================
   CMake - Cross Platform Makefile Generator
   Copyright 2000-2009 Kitware, Inc., Insight Software Consortium

   Distributed under the OSI-approved BSD License (the "License");
   see accompanying file Copyright.txt for details.

   This software is distributed WITHOUT ANY WARRANTY; without even the
   implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
   See the License for more information.
============================================================================*/

to

/* Distributed under the OSI-approved BSD 3-Clause License.  See 
accompanying
    file Copyright.txt or https://cmake.org/licensing for details.  */

Alex


