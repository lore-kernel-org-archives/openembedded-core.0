Return-Path: <prvs=0203fae9d5=mike.looijmans@topicproducts.com>
Received: from mx5-04.smtp.antispamcloud.com (mx5-04.smtp.antispamcloud.com
	[95.211.112.140])
	by mail.openembedded.org (Postfix) with ESMTP id A30747321C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jan 2017 07:18:53 +0000 (UTC)
Received: from [37.74.225.130] (helo=TOP-EX01.TOPIC.LOCAL)
	by mx5.antispamcloud.com with esmtps (TLSv1:ECDHE-RSA-AES128-SHA:128)
	(Exim 4.86) (envelope-from <mike.looijmans@topicproducts.com>)
	id 1cY6Ei-0006VT-Qj; Mon, 30 Jan 2017 08:18:51 +0100
Received: from [192.168.80.121] (192.168.80.121) by webmail.topic.nl
	(192.168.10.102) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 30 Jan 2017 08:18:47 +0100
To: <openembedded-core@lists.openembedded.org>
References: <1479848501-5451-1-git-send-email-manjukumar.harthikote-matha@xilinx.com>
	<CAMKF1spiS9_qTRf2_01rVRTfwKLoZ+WDYm7Hy4_Dr5On7eDLXw@mail.gmail.com>
	<14EB1FFCA0C8D24A8B04EDEC1EA78C2453DBB31E@XSJ-PSEXMBX01.xlnx.xilinx.com>
	<05c7dfd0-38f3-b684-db94-38121b086a67@topic.nl>
	<CA+aJhH03XW19tEX5nP7WgoV6au9xmms6GuASEHMmRvA-1qhh8w@mail.gmail.com>
	<ee6f0244-0fb1-ad27-6056-a358b5eb0112@gmail.com>
	<1efda273-0a0f-e75d-1364-6ac1815154fe@topic.nl>
	<d176c428-1cd5-02dd-d49e-c3299128f529@gmail.com>
From: Mike Looijmans <mike.looijmans@topic.nl>
Organization: TOPIC
Message-ID: <10aa5a73-fd39-c184-0f2d-ff9c4deab83a@topic.nl>
Date: Mon, 30 Jan 2017 08:18:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <d176c428-1cd5-02dd-d49e-c3299128f529@gmail.com>
X-Originating-IP: [192.168.80.121]
X-EXCLAIMER-MD-CONFIG: 9833cda7-5b21-4d34-9a38-8d025ddc3664
X-EXCLAIMER-MD-BIFURCATION-INSTANCE: 0
X-Originating-IP: 37.74.225.130
X-SpamExperts-Domain: topic.nl
X-SpamExperts-Username: 37.74.225.128/28
Authentication-Results: antispamcloud.com;
	auth=pass smtp.auth=37.74.225.128/28@topic.nl
X-SpamExperts-Outgoing-Class: ham
X-SpamExperts-Outgoing-Evidence: Combined (0.02)
X-Recommended-Action: accept
X-Filter-ID: s0sct1PQhAABKnZB5plbIbbvfIHzQjPVmPLZeVYSu3xU9luQrU+8/8qthi+0Jd/W/95+6ZE6dI+d
	FNTaLLKrTD4PkK8WOoKuw32u9iEtZmisSr42qUwvK7U11fJ5smF5bE7GwnNXTE7JFCR1ojdwNM6B
	uR+YL2sh07Qh5gj7SfbOiYlsMEQ//dWL7dpi6RL2/X2X8nT0evubal0lHT0GUWbjO41FyBEqIaDu
	dcVplPGNaieKxw/vh63RdlaW2Zj1hcQD6Dxo9kokFZNwiacNPxeTCKssqlJePCDBHWfCYUvWOATT
	vnG+QUCcfrSs6FZc7tZ3vKwSN7Mv0HNteAusUZ8BuYwGqmI8Tx/Ism0pnCcmlWACu0WC7nIKSPYV
	aBAAdpU0oUDqng6Dyy2mQeofiVRZsYh2Q9DnC+YWf3B7P3p1el35jO+WJBgrWGjAavfuifnL+9wg
	oTj4ygNPw1XfN1IUJ2+rCMPpQhII5VkEVC//8GRISD+lYCwA5l6/Q4nfg8y63jKKBrO1BroJmvb9
	eS8/gEZbIQzNpzl9FXiGPzJpwWXpE+sdjNmnXWjiNaLzpYbRm1I468S/yL0UV2VaFaHU7TvqT2so
	IjU4ke4l3yHonV+E7OMXRvgtdyMlnmWipt3MlrfVMPiosy1D17y+W2wRetLdPST6mA1fZaRFk5bv
	NoxE6pOR992EVUokbOfYInHPhNiH3NSHpRQdFLiVVNV0df1+ARMcUlNXLVWxy/18BrHvkSsNm9Qm
	kmrg2CBrlprCg1eH/Nhc39gnrWGZIANbj6XVNNuQD6J+3hareO7yiUY8TreR0P4ETYe4hw3roeMn
	bS6QSD6VR//zgXRz0/Who2Fj49gF02Ll2tnhMsNwYwxLVk7KyjoPcS+Dqz1vEdfEJTenaNqhr51h
	caKl2YHP6/iq8d1X45/a85ewDMgBmHw8HXDqcPgTnbUxy0RX1Vgsn3QSH5FIz6+Y/GSvCBslklW7
	VHdWydPFuDkcDMpcIfEMOdKU0D9G32eqwv1Zp7thMx/SHJ65IDpHZXia3w==
X-Report-Abuse-To: spam@quarantine2.antispamcloud.com
Subject: Re: [PATCH][Morty] binutils-2.27.inc: Fix alignment frags for aarch64
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
X-List-Received-Date: Mon, 30 Jan 2017 07:18:54 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

=EF=BB=BFOn 24-01-17 16:45, akuster808 wrote:
>
>
> On 01/23/2017 10:48 PM, Mike Looijmans wrote:
>> On 18-01-17 17:09, akuster808 wrote:
>>>
>>>
>>> On 01/18/2017 04:08 AM, Nathan Rossi wrote:
>>>> On 18 January 2017 at 19:37, Mike Looijmans <mike.looijmans@topic.nl> =
wrote:
>>>>> Could someone at least please say "yes" or "no"?
>>>>>
>>>>> I now have three projects waiting for this patch to be included in mo=
rty. If
>>>>> it's not going to happen, I'll have to add a bbappend to these layers=
 to fix
>>>>> it.
>>>>>
>>>>> On 16-01-17 18:49, Manjukumar Harthikote Matha wrote:
>>>>>> Ping, this has been applied to master
>>>> Armin, you mentioned on IRC ~1 week ago that you had merged it to your
>>>> staging branch? Any updates?
>>>> Also I had a look and could not find the change in
>>>> http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=3Dakuste=
r/morty-next?
>>>>
>>>>
>>>> Maybe I am looking in the wrong place though for your staging tree?
>>> I forgot to press go. Its there now.
>>
>> Much appreciated.
>>
>> Who's next in line to press "go" now? I still have three projects waitin=
g.
> Richard or one of his minions.
>

Ping... please?



Kind regards,

Mike Looijmans
System Expert

TOPIC Products
Materiaalweg 4, NL-5681 RJ Best
Postbus 440, NL-5680 AK Best
Telefoon: +31 (0) 499 33 69 79
E-mail: mike.looijmans@topicproducts.com
Website: www.topicproducts.com

Please consider the environment before printing this e-mail






