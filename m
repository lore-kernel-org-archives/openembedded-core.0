Return-Path: <philip@balister.org>
Received: from starfish.geekisp.com (starfish.geekisp.com [216.168.135.166])
	by mail.openembedded.org (Postfix) with ESMTP id 986BB78319
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Aug 2017 22:36:02 +0000 (UTC)
Received: (qmail 32034 invoked by uid 1003); 29 Aug 2017 22:36:02 -0000
Received: from unknown (HELO ?192.168.11.142?)
	(philip@opensdr.com@108.44.111.57)
	by mail.geekisp.com with (DHE-RSA-AES128-SHA encrypted) SMTP;
	29 Aug 2017 22:36:02 -0000
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <cover.1504036763.git.pkj@axis.com>
	<20170829200453.2382.2374@do.openembedded.org>
	<36fcdba0fe5f4161b32cc01d9bf87985@XBOX02.axis.com>
From: Philip Balister <philip@balister.org>
Message-ID: <c752c36a-0b4c-7ab0-5ce1-b98bf8998585@balister.org>
Date: Tue, 29 Aug 2017 18:35:57 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <36fcdba0fe5f4161b32cc01d9bf87985@XBOX02.axis.com>
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yIEF2b2lkIGJ1aWxkIGZhaWx1cmVzIGR1ZSB0byBzZXRzY2VuZSBlcnJvcnM=?=
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
X-List-Received-Date: Tue, 29 Aug 2017 22:36:03 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 8bit

On 08/29/2017 04:25 PM, Peter Kjellerstedt wrote:
>> -----Original Message-----
>> From: Patchwork [mailto:patchwork@patchwork.openembedded.org]
>> Sent: den 29 augusti 2017 22:05
>> To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
>> Cc: openembedded-core@lists.openembedded.org
>> Subject: ✗ patchtest: failure for Avoid build failures due to setscene
>> errors
>>
>> == Series Details ==
>>
>> Series: Avoid build failures due to setscene errors
>> Revision: 1
>> URL   : https://patchwork.openembedded.org/series/8575/
>> State : failure
>>
>> == Summary ==
>>
>>
>> Thank you for submitting this patch series to OpenEmbedded Core. This is
>> an automated response. Several tests have been executed on the proposed
>> series by patchtest resulting in the following failures:
>>
>>
>>
>> * Issue             Series does not apply on top of target branch [test_series_merge_on_head]
>>   Suggested fix    Rebase your series on top of targeted branch
>>   Targeted branch  master (currently at 2454019844)
> 
> Argh, why can't this handle combined bitbake and OE-Core changes, i.e., 
> changes for Poky. Oh well, separate patches coming up...

Because poky isn't the upstream project.

Philip

> 
>> If you believe any of these test results are incorrect, please reply to the
>> mailing list (openembedded-core@lists.openembedded.org) raising your concerns.
>> Otherwise we would appreciate you correcting the issues and submitting a new
>> version of the patchset if applicable. Please ensure you add/increment the
>> version number when sending the new version (i.e. [PATCH] -> [PATCH v2] ->
>> [PATCH v3] -> ...).
>>
>> ---
>> Test framework: http://git.yoctoproject.org/cgit/cgit.cgi/patchtest
>> Test suite:     http://git.yoctoproject.org/cgit/cgit.cgi/patchtest-oe
> 
> //Peter
> 

