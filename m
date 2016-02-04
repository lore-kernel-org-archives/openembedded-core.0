Return-Path: <mike.looijmans@topicproducts.com>
Received: from mx12-05.smtp.antispamcloud.com (mx12-05.smtp.antispamcloud.com
	[46.165.232.175])
	by mail.openembedded.org (Postfix) with ESMTP id 1FB67770FA
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Feb 2016 12:56:51 +0000 (UTC)
Received: from 100-208.ftth.onsbrabantnet.nl ([88.159.208.100]
	helo=TOP-EX01.TOPIC.LOCAL)
	by mx12.antispamcloud.com with esmtps (TLSv1:AES256-SHA:256)
	(Exim 4.85) (envelope-from <mike.looijmans@topicproducts.com>)
	id 1aRJSn-0006e0-6a for openembedded-core@lists.openembedded.org;
	Thu, 04 Feb 2016 13:56:49 +0100
Received: from [192.168.80.121] (192.168.80.121) by TOP-EX01.TOPIC.LOCAL
	(192.168.10.102) with Microsoft SMTP Server (TLS) id 14.3.224.2;
	Thu, 4 Feb 2016 13:56:44 +0100
To: <openembedded-core@lists.openembedded.org>
References: <56B0AE88.3090103@siemens.com> <1454446338.7421.45.camel@pbcl.net>
	<46DD8494-2C7E-44B8-8793-12228FD56738@gmail.com>
	<1454532510.7421.54.camel@pbcl.net>
	<CAMKF1sqevO99mD2V1xxZEa7--LX9vctuFebLc59fOej3xnjkhA@mail.gmail.com>
	<1454533078.7421.57.camel@pbcl.net>
	<CAMKF1srGn-maJcvPLQSV6Xz7RgU4N1Jipr+Oc9AH_B1xsj-UQw@mail.gmail.com>
From: Mike Looijmans <mike.looijmans@topic.nl>
Organization: TOPIC
Message-ID: <56B34A8B.5040405@topic.nl>
Date: Thu, 4 Feb 2016 13:56:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1srGn-maJcvPLQSV6Xz7RgU4N1Jipr+Oc9AH_B1xsj-UQw@mail.gmail.com>
X-Originating-IP: [192.168.80.121]
X-EXCLAIMER-MD-CONFIG: 9833cda7-5b21-4d34-9a38-8d025ddc3664
X-EXCLAIMER-MD-BIFURCATION-INSTANCE: 0
X-Filter-ID: s0sct1PQhAABKnZB5plbIbbvfIHzQjPVmPLZeVYSu3xU9luQrU+8/8qthi+0Jd/W6KAUC/fjyuDn
	NXFr4uarw0hD9tOHsAupOgHE9PArDByM+/sFVMoIHnzxJpiwTwAmqWxCevbUegdCrqkn8BN/sbj/
	kr1uWvhVMCtfj6/xQtWU2yOX8PQJGjCrFTzGoLEG6qRPWZXLLVCm/J3adcaGPgWdtN4gC2+aLO2h
	lecrPdUccBIk1Sag4dKiqCrF8eZZT/hdFFgBT9ea6XfhiStFUv0vp5jSjOOm60a9gEPheCAX2ECf
	0tidf4f9xbnt4dr3ucE6FVHy9oQcVLiVeDoadp8jI9oH6dGc6edzLFJtSM1o5rQC2VE4ySdZe0mi
	K6wgOmG6/54gza7q5Za0AFsz6J51OyFNIoaxpS1mXZNdroDmT8QCc9ZpOAxSvIJNEAP1O4I2wVTs
	obDkZgzKyHvXxNy0HPTmuB9/GAQDSlCp43waKXvNWrRcSD72jROfhu6vZJ0Q4x+0GOxZvoENDONK
	wZkjGlUCvU6ZAmJB8zrNH9BlxMWrrEY4M+w4AQhbqSGAGfxNlhQyZmS3TgLw2A6IYlwvyVyNd0zt
	xHpovTZEu2ZhcIWmrxicQkxvc9w0CTELrSOIPpeqwlm2NDGXIJ2x7JRglvLLWVUnqdg6gt3vmJi/
	EuhRQ6HZH7TD+UzWkF8W12aoSjUKxdXaKO35Ea/DrU+pok6SWPRM754kFPO4pu4=
X-Report-Abuse-To: spam@mx99.antispamcloud.com
X-Filter-Fingerprint: IFrWXGses7OKB5S5G8/dJUb3OPwsHaH0Fvg5oXltHd/JUWjZ8+qhjyB23tbDuyLOYL8Ff78gYsez
	4Rl08xudmXi4esCQ0R1MchVjt7wblGlvhFgW0MjUMRkF5sMCDfftTXNFDzN17hnrWeZYOJvLq0Ic
	WjZ+XcEjj/7Pkld0zkmvziDInX9WdMov2kn2yXjdwv61T+KDYyYtREgszdyFwv8IxCB3p/oCKvxr
	eyISh3JGb7OS5oVgiO+kDxZrVPLz3MmEGC2PrUKqLq5WmHK+Nw==
X-Originating-IP: 88.159.208.100
X-SpamExperts-Domain: topic.nl
X-SpamExperts-Username: 88.159.208.100
Authentication-Results: antispamcloud.com;
	auth=pass smtp.auth=88.159.208.100@topic.nl
X-SpamExperts-Outgoing-Class: ham
X-SpamExperts-Outgoing-Evidence: SB/global_tokens (0.00465254017537)
X-Recommended-Action: accept
Subject: Re: Default value for FULL_OPTIMIZATION
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
X-List-Received-Date: Thu, 04 Feb 2016 12:56:52 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

=EF=BB=BFOn 03-02-16 21:59, Khem Raj wrote:
> On Wed, Feb 3, 2016 at 12:57 PM, Phil Blundell <pb@pbcl.net> wrote:
>> On Wed, 2016-02-03 at 12:51 -0800, Khem Raj wrote:
>>> On Wed, Feb 3, 2016 at 12:48 PM, Phil Blundell <pb@pbcl.net> wrote:
>>>> On Tue, 2016-02-02 at 22:17 -0800, Khem Raj wrote:
>>>>> -pipe does speed up build time so its an optimization.
>>>>
>>>> How much does it really speed it up by?  I seem to recall the effect w=
as
>>>> fairly negligible, but maybe I am remembering that wrong.
>>>
>>> it does not create files for intermediate objects so if you have slow
>>> media it can be significant
>>> but if you have SSDs then it might be diminished.
>>
>> The files go in /tmp though, right?  Even if that isn't a tmpfs, which I
>> think it is on almost all systems nowadays, they will almost certainly
>> just sit in the buffer cache and never actually get written to the
>> disk.
>
> in systems of  this age it should be yet.

In the lab, yes.

In the real world, the system may be under load. On desktop computers, /tmp=
/=20
is usually NOT on tmpfs.

At some point, in order to "write" to your filesystem, it will need to read=
 it=20
first (e.g. to get a free allocation spot). In that cause, the read request=
=20
will have to get in line behind the other IO requests in the queue, and it=
=20
suddenly might take seconds to perform that simple request. Even on SSD, th=
is=20
will happen and give a noticable drop in performance.

You might want to run that test while reading your disk (dd if=3D/dev/sda=20
of=3D/dev/null) and see what happens.


Kind regards,

Mike Looijmans
System Expert

TOPIC Embedded Products
Eindhovenseweg 32-C, NL-5683 KH Best
Postbus 440, NL-5680 AK Best
Telefoon: +31 (0) 499 33 69 79
E-mail: mike.looijmans@topicproducts.com
Website: www.topicproducts.com

Please consider the environment before printing this e-mail

Visit us at: Embedded World 2016 Germany, Hall 1, stand number 220.
Click here to schedule an appointment with us at Embedded World, free ticke=
t included

http://topicembeddedproducts.com/schedule-an-appointment/



