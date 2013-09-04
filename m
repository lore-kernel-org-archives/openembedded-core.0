Return-Path: <Paul_Woegerer@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id BB2B66C083
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Sep 2013 15:18:57 +0000 (UTC)
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1VHErD-0006M2-4y from Paul_Woegerer@mentor.com ;
	Wed, 04 Sep 2013 08:18:59 -0700
Received: from SVR-IES-FEM-01.mgc.mentorg.com ([137.202.0.104]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Wed, 4 Sep 2013 08:18:59 -0700
Received: from atv-pwoegere-l3.atv.mentorg.com (137.202.0.76) by
	SVR-IES-FEM-01.mgc.mentorg.com (137.202.0.104) with Microsoft SMTP
	Server id 14.2.247.3; Wed, 4 Sep 2013 16:18:57 +0100
Message-ID: <52274F60.5090603@mentor.com>
Date: Wed, 4 Sep 2013 17:18:56 +0200
From: "Woegerer, Paul" <Paul_Woegerer@mentor.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130801 Thunderbird/17.0.8
MIME-Version: 1.0
To: Otavio Salvador <otavio@ossystems.com.br>
References: <8563861.p8X6iV9RD6@atv-pwoegere-l3.atv.mentorg.com>
	<CAP9ODKqZZtbthB479VE6Xeso47YUQmtLBbnN=cudDF0YKLe-rw@mail.gmail.com>
In-Reply-To: <CAP9ODKqZZtbthB479VE6Xeso47YUQmtLBbnN=cudDF0YKLe-rw@mail.gmail.com>
X-OriginalArrivalTime: 04 Sep 2013 15:18:59.0252 (UTC)
	FILETIME=[1458A740:01CEA982]
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] lttng-ust: Update to version 2.3.0
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
X-List-Received-Date: Wed, 04 Sep 2013 15:18:58 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 09/04/2013 05:10 PM, Otavio Salvador wrote:
> On Wed, Sep 4, 2013 at 9:51 AM, Woegerer, Paul <Paul_Woegerer@mentor.com> wrote:
>
> This kind of patch is nicer to send using -M option for format-patch
> so it tracks the renaming.
>
 
Thanks! I will keep that in mind for future submissions.

BTW, wouldn't it anyway make sense to change the recipes for lttng-ust,
lttng-ust, babeltrace to the same scheme as lttng-modules ? Then we
wouldn't need those nasty renaming anymore.

--
Best,
Paul

-- 
Paul Woegerer, SW Development Engineer
Sourcery Analyzer <http://go.mentor.com/sourceryanalyzer>
Mentor Graphics, Embedded Software Division


